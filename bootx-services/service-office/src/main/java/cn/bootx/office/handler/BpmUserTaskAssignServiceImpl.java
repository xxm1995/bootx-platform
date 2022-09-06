package cn.bootx.office.handler;

import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.exception.ModelNodeNotExistException;
import cn.bootx.starter.flowable.handler.behavior.BpmUserTaskAssignService;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import lombok.val;
import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.engine.impl.util.TaskHelper;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

import static cn.bootx.starter.flowable.code.ModelNodeCode.*;

/**
 * 处理普通任务人员分配
 * @author xxm
 * @date 2022/9/4 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmUserTaskAssignServiceImpl implements BpmUserTaskAssignService {
    private final BpmModelNodeManager bpmModelNodeManager;

    @Override
    public void handleAssignments(TaskService taskService,
                                  String assignee,
                                  String owner, List<String> candidateUsers,
                                  List<String> candidateGroups,
                                  TaskEntity task,
                                  ExpressionManager expressionManager,
                                  DelegateExecution execution,
                                  ProcessEngineConfigurationImpl processEngineConfiguration,
                                  UserTaskActivityBehavior userTaskActivityBehavior) {
        Long userId = null;
        BpmContext bpmContext = BpmContextLocal.get();

        // 情况一，如果是多实例的任务，例如说会签、串签等情况，已经被分配完毕, 直接从 Variable 中获取。
        val multiInstanceActivityBehavior = userTaskActivityBehavior.getMultiInstanceActivityBehavior();
        if (Objects.nonNull(userTaskActivityBehavior.getMultiInstanceActivityBehavior())) {
            userId = execution.getVariable(multiInstanceActivityBehavior.getCollectionElementVariable(), Long.class);
            TaskHelper.changeTaskAssignee(task, String.valueOf(userId));
            return;
        }

        // 情况二，如果非多实例的任务，则获取节点配置并设置处理人
        BpmModelNode modelTask = bpmModelNodeManager.findByDefIdAndTaskId(task.getProcessDefinitionId(), task.getTaskDefinitionKey())
                .orElseThrow(ModelNodeNotExistException::new);
        // 发起人
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_SPONSOR)){

        }
        // 用户手动选择
        if (Objects.equals(modelTask.getAssignType(), ASSIGN_SELECT)){
            userId = bpmContext.getNextAssignUserId();
        }

        // 指定用户
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_USER)){
            userId = (Long) modelTask.getAssignRaw();
        }

        // 指定角色 角色有多个, 只会从里面抽一个人
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_ROLE)){
            Long roleId = (Long) modelTask.getAssignRaw();
        }
        // 部门负责人  负责人有多个, 只会从里面抽一个人
        if (Objects.equals(modelTask.getAssignType(),ASSIGN_DEPT_LEADER)){
            Long deptId = (Long) modelTask.getAssignRaw();

        }
        TaskHelper.changeTaskAssignee(task, String.valueOf(userId));
    }
}
