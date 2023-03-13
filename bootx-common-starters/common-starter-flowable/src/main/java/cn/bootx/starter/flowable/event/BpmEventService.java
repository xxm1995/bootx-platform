package cn.bootx.starter.flowable.event;

import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import java.util.List;

/**
 * 流程时间发送器
 *
 * @author xxm
 * @date 2022/9/18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmEventService {

    private final ApplicationEventPublisher eventPublisher;

    /**
     * 注册 事务提交成功后的回调操作
     * @param runnable 回调函数
     */
    private void afterCommit(Runnable runnable) {
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
            @Override
            public void afterCommit() {
                runnable.run();
            }
        });
    }

    /**
     * 流程创建事件
     */
    public void processCreated(BpmInstance bpmInstance) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new ProcessCreatedEvent(this, bpmInstance));
        });
    }

    /**
     * 流程完成事件
     */
    public void processCompleted(BpmInstance bpmInstance) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new ProcessCompletedEvent(this, bpmInstance));
        });
    }

    /**
     * 流程取消事件
     */
    public void processCancel(BpmInstance bpmInstance) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new ProcessCancelEvent(this, bpmInstance));
        });
    }

    /**
     * 任务创建事件
     */
    public void taskCreated(BpmTask task) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new TaskCreatedEvent(this, task));
        });
    }

    /**
     * 任务完成事件
     */
    public void taskCompleted(List<BpmTask> tasks, boolean multi) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new TaskCompletedEvent(this, tasks, multi));
        });
    }

    /**
     * 任务分配人员事件
     */
    public void taskAssign(BpmTask task, Long oldAssign, String oldAssignName, Long newAssign, String newAssignName) {
        this.afterCommit(() -> {
            eventPublisher
                    .publishEvent(new TaskAssignEvent(this, task, oldAssign, oldAssignName, newAssign, newAssignName));
        });
    }

    /**
     * 任务取消事件
     */
    public void taskCancel(List<BpmTask> tasks) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new TaskCancelEvent(this, tasks));
        });
    }

    /**
     * 驳回
     */
    public void taskReject(BpmTask task) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new TaskRejectEvent(this, task));
        });
    }

    /**
     * 退回回
     */
    public void taskBack(BpmTask task) {
        this.afterCommit(() -> {
            eventPublisher.publishEvent(new TaskBackEvent(this, task));
        });
    }

}
