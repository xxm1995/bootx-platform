package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**
 * 流程任务退回事件
 * @author xxm
 * @date 2022/9/18
 */
@Getter
public class TaskBackEvent extends ApplicationEvent {
    private final BpmTask bpmTask;

    public TaskBackEvent(Object source, BpmTask bpmTask) {
        super(source);
        this.bpmTask = bpmTask;
    }
}
