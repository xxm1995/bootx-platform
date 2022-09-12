package cn.bootx.starter.flowable.handler.listener;

import cn.bootx.common.core.function.UserDetailService;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.engine.delegate.event.FlowableCancelledEvent;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Optional;
import java.util.Set;

import static org.flowable.common.engine.api.delegate.event.FlowableEngineEventType.*;

/**
 *
 * @author xxm
 * @date 2022/8/28
 */
@Slf4j
@Component
public class BpmInstanceEventListener extends AbstractFlowableEngineEventListener {
    private final BpmInstanceManager bpmInstanceManager;
    private final UserDetailService userDetailService;

    /** 处理的事件 */
    private static final Set<FlowableEngineEventType> TASK_EVENTS = CollUtil.newHashSet(
            PROCESS_CREATED,
            PROCESS_CANCELLED,
            PROCESS_COMPLETED
    );
    public BpmInstanceEventListener(BpmInstanceManager bpmInstanceManager, UserDetailService userDetailService){
        super(TASK_EVENTS);
        this.bpmInstanceManager = bpmInstanceManager;
        this.userDetailService = userDetailService;
    }

    /**
     * 流程创建
     */
    @Override
    protected void processCreated(FlowableEngineEntityEvent event) {
        ProcessInstance instance = (ProcessInstance)event.getEntity();
        BpmContext bpmContext = BpmContextLocal.get();
        BpmInstance bpmInstance = new BpmInstance()
                .setInstanceId(instance.getProcessInstanceId())
                .setInstanceName(instance.getName())
                .setDefId(instance.getProcessDefinitionId())
                .setDefName(instance.getProcessDefinitionName())
                .setStartTime(LocalDateTimeUtil.of(instance.getStartTime()))
                .setFormVariables(bpmContext.getFormVariables());

        // 发起人信息
        bpmContext.getStartUser().ifPresent(userDetail -> bpmInstance.setStartUserId(userDetail.getId())
                .setStartUserName(userDetail.getName()));

        bpmInstanceManager.save(bpmInstance);
    }

    /**
     * 流程取消
     */
    @Override
    protected void processCancelled(FlowableCancelledEvent event) {

    }

    /**
     * 流程完成
     */
    @Override
    protected void processCompleted(FlowableEngineEntityEvent event) {
        ProcessInstance instance = (ProcessInstance)event.getEntity();
        Optional<BpmInstance> bpmInstanceOpt = bpmInstanceManager.findByInstanceId(instance.getProcessInstanceId());

        bpmInstanceOpt.ifPresent(bpmInstance -> {
            bpmInstance.setEndTime(LocalDateTime.now());
            bpmInstanceManager.updateById(bpmInstance);
        });
    }
}
