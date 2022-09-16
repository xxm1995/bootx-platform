package cn.bootx.office.handler;

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

/**   
 * Bpm 多实例行为服务
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
    public List<Long> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior multiInstanceActivityBehavior) {
        List<Long> userIds = new ArrayList<>(0);
        BpmContext bpmContext = BpmContextLocal.get();
        // TODO 处理驳回情况的人员分配

        // 获取节点配置并设置处理人
        BpmModelNode modelTask = bpmModelNodeManager.findByDefIdAndNodeId(execution.getProcessDefinitionId(), execution.getCurrentActivityId())
                .orElseThrow(ModelNodeNotExistException::new);

        // 发起人
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_SPONSOR)){
            Long startUserId = this.getStartUserId(execution.getProcessInstanceId());
            userIds = Collections.singletonList(startUserId);
        }
        // 用户手动选择
        if (Objects.equals(modelTask.getAssignType(), ASSIGN_SELECT)){
            //noinspection unchecked
            userIds = (List<Long>) bpmContext.getNextAssign();
        }

        // 指定用户组
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_USER_GROUP)){
            //noinspection unchecked
            userIds = (List<Long>) modelTask.getAssignRaw();
        }

        // 指定角色
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_GROUP)){
            //noinspection unchecked
            List<Long> roleIds = (List<Long>) modelTask.getAssignRaw();
            userIds = getUserIdsByRole(roleIds);
        }

        return userIds;
    }

    /**
     * 获取发起人id
     */
    private Long getStartUserId(String processInstanceId) {
        return bpmInstanceManager.findByInstanceId(processInstanceId).map(BpmInstance::getStartUserId)
                .orElse(null);
    }

    /**
     * 根据角色获取人员id集合
     */
    private List<Long> getUserIdsByRole(List<Long> roleIds){
        return userRoleManager.findAllByRoles(roleIds).stream().map(UserRole::getUserId).collect(Collectors.toList());
    }

    /**
     * 是否满足结束条件
     */
    @Override
    public boolean completionConditionSatisfied(DelegateExecution execution) {
        BpmContext bpmContext = BpmContextLocal.get();

        // 获取节点配置
        BpmModelNode node = bpmModelNodeManager.findByDefIdAndNodeId(execution.getProcessDefinitionId(), execution.getCurrentActivityId())
                .orElseThrow(ModelNodeNotExistException::new);
        // 判断是否是或签
        if (Objects.equals(node.getOrSign(),true)){
            // 获取当前人是否是通过选择了通过
            execution.getId();
            if (Objects.equals(RESULT_PASS,bpmContext.getTaskResult())){
                return true;
            }
        }
        // 判断是否是比例通过
        if (Objects.equals(node.getRatioPass(),true)){
            double passRatio = Optional.ofNullable(node.getPassRatio())
                    .orElse(50.0);
            // 查询当前任务完成的个数
            List<BpmTask> tasks = bpmTaskManager.findByInstanceIdAndNodeId(execution.getProcessInstanceId(), execution.getCurrentActivityId());
            long passCount = tasks.stream()
                    .filter(o -> Objects.equals(o.getResult(), RESULT_PASS))
                    .count();
            double ratio = NumberUtil.div(passCount,tasks.size()) * 100;
            if (ratio >= passRatio){
                return true;
            }
        }

        return false;
    }

}
