package cn.bootx.starter.flowable.handler.behavior;

import lombok.extern.slf4j.Slf4j;
import org.flowable.bpmn.model.UserTask;
import org.flowable.common.engine.impl.el.ExpressionManager;
import org.flowable.engine.delegate.DelegateExecution;
import org.flowable.engine.impl.bpmn.behavior.UserTaskActivityBehavior;
import org.flowable.engine.impl.cfg.ProcessEngineConfigurationImpl;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;

import java.util.List;

/**
 * Bpm 自定义单个任务人员分配
 *
 * @author xxm
 * @date 2022/8/24
 */
@Slf4j
public class BpmUserTaskActivityBehavior extends UserTaskActivityBehavior {

    private final BpmUserTaskAssignService bpmUserTaskAssignService;

    public BpmUserTaskActivityBehavior(UserTask userTask, BpmUserTaskAssignService bpmUserTaskAssignService) {
        super(userTask);
        this.bpmUserTaskAssignService = bpmUserTaskAssignService;
    }

    /**
     * 处理作业, 分配人员
     */
    @Override
    protected void handleAssignments(TaskService taskService, String assignee, String owner,
            List<String> candidateUsers, List<String> candidateGroups, TaskEntity task,
            ExpressionManager expressionManager, DelegateExecution execution,
            ProcessEngineConfigurationImpl processEngineConfiguration) {

        bpmUserTaskAssignService.handleAssignments(taskService, assignee, owner, candidateUsers, candidateGroups, task,
                expressionManager, execution, processEngineConfiguration, this);
    }

}
