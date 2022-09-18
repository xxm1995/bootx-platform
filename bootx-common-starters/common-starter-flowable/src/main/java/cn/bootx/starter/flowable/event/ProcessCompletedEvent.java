package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import lombok.Getter;
import org.springframework.context.ApplicationEvent;

/**   
 * 流程实例完成事件
 * @author xxm  
 * @date 2022/9/18 
 */
@Getter
public class ProcessCompletedEvent extends ApplicationEvent {
    private final BpmInstance bpmInstance;

    public ProcessCompletedEvent(Object source, BpmInstance bpmInstance) {
        super(source);
        this.bpmInstance = bpmInstance;
    }
}
