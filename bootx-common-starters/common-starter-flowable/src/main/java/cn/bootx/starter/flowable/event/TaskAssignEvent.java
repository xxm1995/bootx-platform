package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**   
 * 流程任务人员分配事件
 * @author xxm  
 * @date 2022/9/18 
 */
@Getter
public class TaskAssignEvent extends ApplicationEvent {
    private final BpmTask bpmTask;
    private final Long oldAssign;
    private final String oldAssignName;
    private final Long newAssign;
    private final String newAssignName;

    public TaskAssignEvent(Object source, BpmTask bpmTask, Long oldAssign, String oldAssignName, Long newAssign, String newAssignName) {
        super(source);
        this.bpmTask = bpmTask;
        this.oldAssign = oldAssign;
        this.oldAssignName = oldAssignName;
        this.newAssign = newAssign;
        this.newAssignName = newAssignName;
    }
}
