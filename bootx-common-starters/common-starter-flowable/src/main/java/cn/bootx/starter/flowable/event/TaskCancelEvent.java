package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.List;

/**
 * 流程任务取消事件
 *
 * @author xxm
 * @date 2022/9/18
 */
@Getter
public class TaskCancelEvent extends ApplicationEvent {

    private final List<BpmTask> bpmTasks;

    public TaskCancelEvent(Object source, List<BpmTask> bpmTasks) {
        super(source);
        this.bpmTasks = bpmTasks;
    }

}
