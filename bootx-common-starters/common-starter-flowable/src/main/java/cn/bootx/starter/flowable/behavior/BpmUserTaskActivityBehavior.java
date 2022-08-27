package cn.bootx.starter.flowable.behavior;


import cn.bootx.starter.flowable.core.model.dao.BpmModelTaskManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelTask;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
public class BpmUserTaskActivityBehavior  extends UserTaskActivityBehavior {
    private final BpmModelTaskManager bpmModelTaskManager;

    public BpmUserTaskActivityBehavior(UserTask userTask, BpmModelTaskManager bpmModelTaskManager) {
        super(userTask);
        this.bpmModelTaskManager = bpmModelTaskManager;
    }

    /**
     * 处理作业, 分配人员
     */
    @Override
    protected void handleAssignments(TaskService taskService, String assignee, String owner,
                                     List<String> candidateUsers, List<String> candidateGroups, TaskEntity task, ExpressionManager expressionManager,
                                     DelegateExecution execution, ProcessEngineConfigurationImpl processEngineConfiguration) {

        // 获取节点配置并设置处理人
        BpmModelTask modelTask = bpmModelTaskManager.findByDefIdAndTaskId(task.getProcessDefinitionId(), task.getTaskDefinitionKey());
        TaskHelper.changeTaskAssignee(task, String.valueOf(modelTask.getUserId()));
    }
}
