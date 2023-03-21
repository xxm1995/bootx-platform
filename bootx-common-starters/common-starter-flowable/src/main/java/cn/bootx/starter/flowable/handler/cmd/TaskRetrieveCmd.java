package cn.bootx.starter.flowable.handler.cmd;

import com.google.common.collect.Lists;
import org.flowable.common.engine.impl.interceptor.Command;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.engine.impl.ActivityInstanceQueryImpl;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.engine.runtime.ActivityInstance;
import org.flowable.task.service.TaskService;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;

import java.util.List;

/**
 * 取回任务命令类
 *
 * @author xxm
 * @date 2020/3/18 11:03
 */
public class TaskRetrieveCmd implements Command<Void> {

    /**
     * 任务id
     */
    protected String taskId;

    public TaskRetrieveCmd(String taskId) {
        this.taskId = taskId;
    }

    @Override
    public Void execute(CommandContext commandContext) {
        TaskService taskService = CommandContextUtil.getTaskService();

        TaskEntity taskEntity = taskService.getTask(taskId);

        List<ActivityInstance> activityInstancesByQueryCriteria = CommandContextUtil.getActivityInstanceEntityManager()
            .findActivityInstancesByQueryCriteria(
                    new ActivityInstanceQueryImpl().processInstanceId(taskEntity.getProcessInstanceId())
                        .orderByActivityInstanceStartTime());

        List<ActivityInstance> reverse = Lists.reverse(activityInstancesByQueryCriteria);

        return null;
    }

}
