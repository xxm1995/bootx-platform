package cn.bootx.starter.flowable.behavior;


import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.engine.impl.util.TaskHelper;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;

import java.util.List;

/**   
 * Bpm 自定义单个任务人员分配
 * @author xxm  
 * @date 2022/8/24 
 */
public class BpmUserTaskActivityBehavior  extends UserTaskActivityBehavior {
    public BpmUserTaskActivityBehavior(UserTask userTask) {
        super(userTask);
    }

    /**
     * 处理作业
     */
    @Override
    protected void handleAssignments(TaskService taskService, String assignee, String owner,
                                     List<String> candidateUsers, List<String> candidateGroups, TaskEntity task, ExpressionManager expressionManager,
                                     DelegateExecution execution, ProcessEngineConfigurationImpl processEngineConfiguration) {
        System.out.println(111);
        TaskHelper.changeTaskAssignee(task, String.valueOf(111));
    }
}
