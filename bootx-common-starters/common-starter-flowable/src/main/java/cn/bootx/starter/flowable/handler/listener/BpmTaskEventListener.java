package cn.bootx.starter.flowable.handler.listener;

import cn.bootx.common.core.util.CollUtil;
import cn.bootx.starter.flowable.handler.service.BpmTaskEventService;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;
import org.springframework.stereotype.Component;

import java.util.Set;

import static org.flowable.common.engine.api.delegate.event.FlowableEngineEventType.*;

/**
 * Bpm 任务事件监听器
 * @author xxm
 * @date 2022/8/24 
 */
@Slf4j
@Component
public class BpmTaskEventListener extends AbstractFlowableEngineEventListener {

    private final BpmTaskEventService bpmTaskEventService;


    /** 处理的事件 */
    private static final Set<FlowableEngineEventType> TASK_EVENTS = CollUtil.newHashSet(
            TASK_CREATED,
            TASK_ASSIGNED,
            TASK_COMPLETED
    );

    public BpmTaskEventListener(BpmTaskEventService bpmTaskEventService) {
        super(TASK_EVENTS);
        this.bpmTaskEventService = bpmTaskEventService;
    }

    /**
     * 存储扩展内容
     */
    @Override
    protected void taskCreated(FlowableEngineEntityEvent event) {
        TaskEntity task = (TaskEntity) event.getEntity();
        bpmTaskEventService.taskCreated(task);
    }

    /**
     * 任务完成
     */
    @Override
    protected void taskCompleted(FlowableEngineEntityEvent event) {
        TaskEntity task = (TaskEntity) event.getEntity();
        bpmTaskEventService.taskCompleted(task);
    }

    /**
     * 任务分配处理人
     */
    @Override
    protected void taskAssigned(FlowableEngineEntityEvent event) {
        TaskEntity task = (TaskEntity) event.getEntity();
        bpmTaskEventService.taskAssigned(task);
    }
}
