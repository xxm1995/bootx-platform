package cn.bootx.office.handler;

import cn.bootx.iam.core.upms.dao.UserRoleManager;
import cn.bootx.iam.core.upms.entity.UserRole;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.exception.ModelNodeNotExistException;
import cn.bootx.starter.flowable.handler.behavior.BpmMultiInstanceAssignService;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.MultiInstanceActivityBehavior;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.ModelNodeCode.*;

/**   
 * 会签串签等任务处理人员分配
 * @author xxm  
 * @date 2022/9/4 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmMultiInstanceAssignServiceImpl implements BpmMultiInstanceAssignService {
    private final BpmModelNodeManager bpmModelNodeManager;
    private final BpmInstanceManager bpmInstanceManager;
    private final UserRoleManager userRoleManager;

    @Override
    public List<Long> getTaskUsers(DelegateExecution execution, MultiInstanceActivityBehavior multiInstanceActivityBehavior) {
        List<Long> userIds = new ArrayList<>(0);
        BpmContext bpmContext = BpmContextLocal.get();
        // TODO 处理驳回情况的人员分配

        // 获取节点配置并设置处理人
        BpmModelNode modelTask = bpmModelNodeManager.findByDefIdAndTaskId(execution.getProcessDefinitionId(), execution.getCurrentActivityId())
                .orElseThrow(ModelNodeNotExistException::new);

        // 发起人
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_SPONSOR)){
            Long startUserId = this.getStartUserId(execution.getProcessInstanceId());
            userIds = Collections.singletonList(startUserId);
        }
        // 用户手动选择
        if (Objects.equals(modelTask.getAssignType(), ASSIGN_SELECT)){
            userIds = bpmContext.getNextAssignUserIds();
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
}
