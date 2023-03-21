package cn.bootx.starter.flowable.handler.service;

import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.starter.flowable.code.TaskCode;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.event.BpmEventService;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.runtime.ProcessInstance;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static cn.bootx.starter.flowable.code.InstanceCode.*;

/**
 * 流程实例事件处理类
 *
 * @author xxm
 * @date 2022/9/16
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmInstanceEvenListenerService {

    private final BpmInstanceManager bpmInstanceManager;

    private final BpmTaskManager bpmTaskManager;

    private final BpmEventService messageService;

    /**
     * 流程创建
     */
    public void processCreated(ProcessInstance instance) {
        BpmContext bpmContext = BpmContextLocal.get();
        BpmInstance bpmInstance = new BpmInstance().setInstanceId(instance.getProcessInstanceId())
            .setInstanceName(instance.getName())
            .setModelId(bpmContext.getModelId())
            .setDefId(instance.getProcessDefinitionId())
            .setDefName(instance.getProcessDefinitionName())
            .setStartTime(LocalDateTimeUtil.of(instance.getStartTime()))
            .setFormVariables(bpmContext.getFormVariables())
            .setState(STATE_RUNNING);

        // 发起人信息
        bpmContext.getStartUser()
            .ifPresent(userDetail -> bpmInstance.setStartUserId(userDetail.getId())
                .setStartUserName(userDetail.getName()));

        bpmInstanceManager.save(bpmInstance);
        messageService.processCreated(bpmInstance);
    }

    /**
     * 任务完成
     */
    @Transactional(rollbackFor = Exception.class)
    public void processCompleted(ProcessInstance instance) {
        Optional<BpmInstance> bpmInstanceOpt = bpmInstanceManager.findByInstanceId(instance.getProcessInstanceId());
        BpmContext bpmContext = BpmContextLocal.get();
        String instanceState = bpmContext.getInstanceState();
        bpmInstanceOpt.ifPresent(bpmInstance -> {
            String state = STATE_FINISH;
            if (StrUtil.isNotBlank(instanceState)) {
                state = instanceState;
            }
            bpmInstance.setEndTime(LocalDateTime.now()).setState(state);
            bpmInstanceManager.updateById(bpmInstance);
            if (Objects.equals(STATE_FINISH, state)) {
                messageService.processCompleted(bpmInstance);
            }
            else {
                messageService.processCancel(bpmInstance);
            }
        });
        if (Objects.equals(instanceState, STATE_CANCEL)) {
            List<BpmTask> tasks = bpmTaskManager.findRunningByInstanceId(instance.getProcessInstanceId());
            tasks.forEach(task -> task.setState(TaskCode.STATE_CANCEL)
                .setResult(TaskCode.RESULT_CANCEL)
                .setEndTime(LocalDateTime.now()));
            bpmTaskManager.updateAllById(tasks);
            messageService.taskCancel(tasks);
        }
    }

}
