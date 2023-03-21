package cn.bootx.office.handler.behavior;

import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.iam.core.upms.dao.UserRoleManager;
import cn.bootx.iam.core.upms.entity.UserRole;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.exception.ModelNodeNotExistException;
import cn.bootx.starter.flowable.handler.behavior.BpmMultiInstanceBehaviorService;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.hutool.core.util.NumberUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.MultiInstanceActivityBehavior;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.ModelNodeCode.*;
import static cn.bootx.starter.flowable.code.TaskCode.RESULT_PASS;
import static cn.bootx.starter.flowable.code.TaskCode.STATE_REJECT;

/**
 * Bpm 多实例行为服务
 *
 * @author xxm
 * @date 2022/9/4
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmMultiInstanceBehaviorServiceImpl implements BpmMultiInstanceBehaviorService {

    private final BpmModelNodeManager bpmModelNodeManager;

    private final BpmInstanceManager bpmInstanceManager;

    private final BpmTaskManager bpmTaskManager;

    private final UserRoleManager userRoleManager;

    /**
     * 人员分配
     * @return
     */
    @Override
    public List<String> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior behavior) {
        BpmContext bpmContext = BpmContextLocal.get();

        // 获取节点配置并设置处理人
        BpmModelNode modelNode = bpmModelNodeManager
            .findByDefIdAndNodeId(execution.getProcessDefinitionId(), execution.getCurrentActivityId())
            .orElseThrow(ModelNodeNotExistException::new);

        // 处理驳回情况的人员分配
        if (Objects.equals(bpmContext.getTaskState(), STATE_REJECT)) {
            return this.rejectOrBack(execution, modelNode, bpmContext, behavior);
        }
        // 正常获取配置的处理人
        return this.getUserIds(execution, modelNode, bpmContext);

    }

    /**
     * 获取处理人
     */
    public List<String> getUserIds(DelegateExecution execution, BpmModelNode modelNode, BpmContext bpmContext) {
        List<String> userIds = new ArrayList<>(0);
        // 发起人
        if (Objects.equals(modelNode.getAssignType(), ASSIGN_SPONSOR)) {
            Long startUserId = this.getStartUserId(execution.getProcessInstanceId());
            userIds = Collections.singletonList(String.valueOf(startUserId));
        }
        // 用户手动选择
        if (Objects.equals(modelNode.getAssignType(), ASSIGN_SELECT)) {
            // noinspection unchecked
            userIds = (List<String>) bpmContext.getNextAssign();
        }

        // 指定用户组
        if (Objects.equals(modelNode.getAssignType(), ASSIGN_USER_GROUP)) {
            // noinspection unchecked
            userIds = (List<String>) modelNode.getAssignRaw();
        }

        // 指定角色
        if (Objects.equals(modelNode.getAssignType(), ASSIGN_GROUP)) {
            // noinspection unchecked
            List<Long> roleIds = (List<Long>) modelNode.getAssignRaw();
            userIds = getUserIdsByRole(roleIds);
        }

        return userIds;
    }

    /**
     * 驳回处理
     */
    private List<String> rejectOrBack(DelegateExecution execution, BpmModelNode modelNode, BpmContext bpmContext,
            MultiInstanceActivityBehavior behavior) {
        // 查询当前环节的任务
        List<BpmTask> tasks = bpmTaskManager.findByInstanceIdAndNodeId(execution.getProcessInstanceId(),
                execution.getCurrentActivityId());
        // noinspection OptionalGetWithoutIsPresent
        Long multiId = tasks.stream().max(Comparator.comparingLong(MpIdEntity::getId)).map(BpmTask::getMultiId).get();
        // 会签和串签处理方式不同
        if (Objects.equals(modelNode.getSequential(), true)) {
            // 串签只能拿到之前执行了的任务, 未执行到的不会进行生成
            List<String> processedUserIds = tasks.stream()
                .filter(task -> Objects.equals(multiId, task.getMultiId()))
                .map(BpmTask::getUserId)
                .map(String::valueOf)
                .collect(Collectors.toList());

            // 补全未执行到的任务信息
            List<String> userIds = this.getUserIds(execution, modelNode, bpmContext);
            if (processedUserIds.size() >= userIds.size()) {
                return processedUserIds;
            }
            else {
                int size = processedUserIds.size();
                // 例如角色一类的分配规则, 重新分配变动了, 可能会出问题, 但我暂时不打算解决
                return CollUtil.sub(userIds, size, userIds.size());
            }
        }
        else {
            // 会签可以拿到之前所有的任务
            return tasks.stream()
                .filter(task -> Objects.equals(multiId, task.getMultiId()))
                .map(BpmTask::getUserId)
                .map(String::valueOf)
                .collect(Collectors.toList());
        }
    }

    /**
     * 获取发起人id
     */
    private Long getStartUserId(String processInstanceId) {
        return bpmInstanceManager.findByInstanceId(processInstanceId).map(BpmInstance::getStartUserId).orElse(null);
    }

    /**
     * 根据角色获取人员id集合
     */
    private List<String> getUserIdsByRole(List<Long> roleIds) {
        return userRoleManager.findAllByRoles(roleIds)
            .stream()
            .map(UserRole::getUserId)
            .map(String::valueOf)
            .collect(Collectors.toList());
    }

    /**
     * 是否满足结束条件
     */
    @Override
    public boolean completionConditionSatisfied(DelegateExecution execution, MultiInstanceActivityBehavior behavior) {
        BpmContext bpmContext = BpmContextLocal.get();

        // 获取节点配置
        BpmModelNode node = bpmModelNodeManager
            .findByDefIdAndNodeId(execution.getProcessDefinitionId(), execution.getCurrentActivityId())
            .orElseThrow(ModelNodeNotExistException::new);
        // 判断是否是或签
        if (Objects.equals(node.getOrSign(), true)) {
            // 获取当前人是否是通过选择了通过
            execution.getId();
            if (Objects.equals(RESULT_PASS, bpmContext.getTaskResult())) {
                return true;
            }
        }
        // 判断是否是比例通过
        if (Objects.equals(node.getRatioPass(), true)) {
            double passRatio = Optional.ofNullable(node.getPassRatio()).orElse(50.0);
            // 查询当前任务完成的个数
            List<BpmTask> tasks = bpmTaskManager.findByInstanceIdAndNodeId(execution.getProcessInstanceId(),
                    execution.getCurrentActivityId());
            long passCount = tasks.stream().filter(o -> Objects.equals(o.getResult(), RESULT_PASS)).count();
            double ratio = NumberUtil.div(passCount, tasks.size()) * 100;
            if (ratio >= passRatio) {
                return true;
            }
        }

        return false;
    }

}
