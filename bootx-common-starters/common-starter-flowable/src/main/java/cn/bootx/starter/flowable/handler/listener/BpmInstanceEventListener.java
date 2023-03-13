package cn.bootx.starter.flowable.handler.listener;

import cn.bootx.common.core.util.CollUtil;
import cn.bootx.starter.flowable.handler.service.BpmInstanceEvenListenerService;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.engine.delegate.event.FlowableCancelledEvent;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Component;

import java.util.Set;

import static org.flowable.common.engine.api.delegate.event.FlowableEngineEventType.*;

/**
 * @author xxm
 * @date 2022/8/28
 */
@Slf4j
@Component
public class BpmInstanceEventListener extends AbstractFlowableEngineEventListener {

    private final BpmInstanceEvenListenerService bpmInstanceEvenListenerService;

    /** 处理的事件 */
    private static final Set<FlowableEngineEventType> TASK_EVENTS = CollUtil.newHashSet(PROCESS_CREATED,
            PROCESS_CANCELLED, PROCESS_COMPLETED);

    public BpmInstanceEventListener(BpmInstanceEvenListenerService bpmInstanceEvenListenerService) {
        super(TASK_EVENTS);
        this.bpmInstanceEvenListenerService = bpmInstanceEvenListenerService;
    }

    /**
     * 流程创建
     */
    @Override
    protected void processCreated(FlowableEngineEntityEvent event) {
        ProcessInstance instance = (ProcessInstance) event.getEntity();
        bpmInstanceEvenListenerService.processCreated(instance);
    }

    /**
     * 流程取消(被删除) 一个进程已被取消。在数据库删除之前由
     * org.flowable.engine.impl.RuntimeServiceImpl#deleteProcessInstance(java.lang.String,
     * java.lang.String) 删除流程实例时调度。
     */
    @Override
    protected void processCancelled(FlowableCancelledEvent event) {
    }

    /**
     * 流程完成
     */
    @Override
    protected void processCompleted(FlowableEngineEntityEvent event) {
        ProcessInstance instance = (ProcessInstance) event.getEntity();
        bpmInstanceEvenListenerService.processCompleted(instance);

    }

}
