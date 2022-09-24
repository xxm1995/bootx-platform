package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

import java.util.List;

/**   
 * 流程任务完成事件
 * @author xxm  
 * @date 2022/9/18 
 */
@Getter
public class TaskCompletedEvent extends ApplicationEvent {
    private final List<BpmTask> bpmTasks;
    private final boolean multi;

    public TaskCompletedEvent(Object source, List<BpmTask> bpmTasks, boolean multi) {
        super(source);
        this.bpmTasks = bpmTasks;
        this.multi = multi;
    }
}
