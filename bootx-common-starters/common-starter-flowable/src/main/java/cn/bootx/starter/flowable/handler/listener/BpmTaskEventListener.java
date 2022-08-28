package cn.bootx.starter.flowable.handler.listener;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.function.UserDetailService;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEntityEvent;
import org.flowable.common.engine.api.delegate.event.FlowableEngineEventType;
import org.flowable.engine.delegate.event.AbstractFlowableEngineEventListener;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.Optional;
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
    private final BpmTaskManager bpmTaskManager;
    private final BpmInstanceManager bpmInstanceManager;
    private final UserDetailService userDetailService;

    /** 处理的事件 */
    private static final Set<FlowableEngineEventType> TASK_EVENTS = CollUtil.newHashSet(
            TASK_CREATED,
            TASK_ASSIGNED,
            TASK_COMPLETED
    );

    public BpmTaskEventListener(BpmTaskManager bpmTaskManager, BpmInstanceManager bpmInstanceManager, UserDetailService userDetailService){
        super(TASK_EVENTS);
        this.bpmTaskManager = bpmTaskManager;
        this.bpmInstanceManager = bpmInstanceManager;
        this.userDetailService = userDetailService;
    }

    /**
     * 存储扩展内容
     */
    @Override
    protected void taskCreated(FlowableEngineEntityEvent event) {
        Task task = (Task) event.getEntity();
        BpmInstance bpmInstance = bpmInstanceManager.findByInstanceId(task.getProcessInstanceId()).orElse(new BpmInstance());
        BpmTask bpmTask = new BpmTask()
                .setTaskId(task.getId())
                .setTaskNodeId(task.getTaskDefinitionKey())
                .setTaskName(task.getName())
                .setFormVariables(task.getCaseVariables())
                .setExecutionId(event.getExecutionId())
                .setInstanceId(task.getProcessInstanceId())
                .setInstanceName(bpmInstance.getInstanceName())
                .setDefName(bpmInstance.getDefName())
                .setStartUserId(bpmInstance.getStartUserId())
                .setStartUserName(bpmInstance.getStartUserName())
                .setStartTime(LocalDateTimeUtil.of(task.getCreateTime()));
        // 是否分配了用户
        if (StrUtil.isNotBlank(task.getAssignee())){
            Long userId = Long.valueOf(task.getAssignee());
            UserDetail userDetail = userDetailService.findByUserId(userId).orElse(new UserDetail());
            bpmTask.setUserId(userId)
                    .setUserName(userDetail.getName());
        }
        bpmTaskManager.save(bpmTask);
    }

    /**
     * 任务完成
     */
    @Override
    protected void taskCompleted(FlowableEngineEntityEvent event) {
        Task task = (Task) event.getEntity();
        Optional<BpmTask> bpmTaskOpt = bpmTaskManager.findByInstanceIdAndTaskId(task.getProcessInstanceId(), task.getId());
        BpmContext bpmContext = BpmContextLocal.get();
        bpmTaskOpt.ifPresent(bpmTask -> {
            bpmTask.setEndTime(LocalDateTime.now())
                    .setFormVariables(bpmContext.getFormVariables());
            bpmTaskManager.updateById(bpmTask);
        });
    }

    /**
     * 任务分配处理人
     */
    @Override
    protected void taskAssigned(FlowableEngineEntityEvent event) {
        Task task = (Task) event.getEntity();

        // 判断扩展内容是否存在, 存的的话进行更新
        Optional<BpmTask> bpmTaskOpt = bpmTaskManager.findByInstanceIdAndTaskId(task.getProcessInstanceId(), task.getId());
        bpmTaskOpt.ifPresent(bpmTask -> {
            if (StrUtil.isNotBlank(task.getAssignee())){
                Long userId = Long.valueOf(task.getAssignee());
                UserDetail userDetail = userDetailService.findByUserId(userId).orElse(new UserDetail());
                bpmTask.setUserId(userId)
                        .setUserName(userDetail.getName());
            }
            bpmTaskManager.updateById(bpmTask);
        });
    }
}
