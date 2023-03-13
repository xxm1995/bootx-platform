package cn.bootx.starter.flowable.handler.behavior;

import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;

import java.util.List;

/**
 * 处理普通任务人员分配
 *
 * @author xxm
 * @date 2022/9/4
 */
public interface BpmUserTaskAssignService {

    /**
     * 处理任务人员分配
     */
    void handleAssignments(TaskService taskService, String assignee, String owner, List<String> candidateUsers,
            List<String> candidateGroups, TaskEntity task, ExpressionManager expressionManager,
            DelegateExecution execution, ProcessEngineConfigurationImpl processEngineConfiguration,
            UserTaskActivityBehavior userTaskActivityBehavior);

}
