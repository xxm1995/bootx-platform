package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**   
 * 流程实例取消事件
 * @author xxm  
 * @date 2022/9/18 
 */
@Getter
public class ProcessCancelEvent extends ApplicationEvent {
    private final BpmInstance bpmInstance;

    public ProcessCancelEvent(Object source, BpmInstance bpmInstance) {
        super(source);
        this.bpmInstance = bpmInstance;
    }
}
