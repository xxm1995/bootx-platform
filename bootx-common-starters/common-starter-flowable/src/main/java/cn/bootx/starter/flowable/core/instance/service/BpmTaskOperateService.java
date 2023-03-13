package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.code.BpmnCode;
import cn.bootx.starter.flowable.code.TaskCode;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.event.BpmEventService;
import cn.bootx.starter.flowable.exception.TaskNotExistException;
import cn.bootx.starter.flowable.handler.reject.TaskRejectHandler;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.bootx.starter.flowable.param.task.TaskApproveParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

import static cn.bootx.starter.flowable.code.TaskCode.*;

/**
 * 流程任务接口
 *
 * @author xxm
 * @date 2022/8/24
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskOperateService {

    private final TaskService taskService;

    private final BpmTaskManager bpmTaskManager;

    private final BpmEventService bpmEventService;

    private final TaskRejectHandler taskRejectHandler;

    /**
     * 处理任务
     */
    @Transactional(rollbackFor = Exception.class)
    public void approve(TaskApproveParam param) {
        // 查询到任务和扩展属性
        Task task = Optional.ofNullable(taskService.createTaskQuery().taskId(param.getTaskId()).singleResult())
                .orElseThrow(TaskNotExistException::new);
        // 实际处理人与设置处理人不一致进行更改
        String userId = String.valueOf(SecurityUtil.getUserId());
        if (!Objects.equals(task.getAssignee(), String.valueOf(userId))) {
            taskService.setAssignee(task.getId(), userId);
        }

        switch (param.getType()) {
            case RESULT_PASS: {
                this.pass(param, task);
                break;
            }
            case RESULT_NOT_PASS: {
                this.notPass(param, task);
                break;
            }
            case RESULT_ABSTAIN: {
                this.abstain(param, task);
                break;
            }
            case RESULT_REJECT: {
                this.reject(param, task);
                break;
            }
            case RESULT_BACK: {
                this.back(param, task);
                break;
            }
            default:
                throw new BizException("不存在的流程服务处理类型");
        }
    }

    /**
     * 通过
     */
    @Transactional(rollbackFor = Exception.class)
    public void pass(TaskApproveParam param, Task task) {
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskReason(param.getReason()).setTaskState(TaskCode.STATE_PASS).setTaskResult(RESULT_PASS)
                .setNextAssign(param.getNextAssign()).setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);

        if (Objects.nonNull(param.getNextNodeId())) {
            Map<String, Object> map = new HashMap<>();
            map.put(BpmnCode.NEXT_NODE_FLAG, param.getNextNodeId());
            taskService.complete(task.getId(), null, map);
        }
        else {
            taskService.complete(task.getId());
        }
    }

    /**
     * 弃权
     */
    @Transactional(rollbackFor = Exception.class)
    public void abstain(TaskApproveParam param, Task task) {
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskReason(param.getReason()).setTaskState(TaskCode.STATE_PASS)
                .setTaskResult(TaskCode.RESULT_ABSTAIN).setNextAssign(param.getNextAssign())
                .setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);
        if (Objects.nonNull(param.getNextNodeId())) {
            Map<String, Object> map = new HashMap<>();
            map.put(BpmnCode.NEXT_NODE_FLAG, param.getNextNodeId());
            taskService.complete(task.getId(), null, map);
        }
        else {
            taskService.complete(task.getId());
        }
    }

    /**
     * 不同意
     */
    @Transactional(rollbackFor = Exception.class)
    public void notPass(TaskApproveParam param, Task task) {
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskReason(param.getReason()).setTaskState(TaskCode.STATE_PASS)
                .setTaskResult(TaskCode.RESULT_NOT_PASS).setNextAssign(param.getNextAssign())
                .setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);
        if (Objects.nonNull(param.getNextNodeId())) {
            Map<String, Object> map = new HashMap<>();
            map.put(BpmnCode.NEXT_NODE_FLAG, param.getNextNodeId());
            taskService.complete(task.getId(), null, map);
        }
        else {
            taskService.complete(task.getId());
        }
    }

    /**
     * 驳回
     */
    @Transactional(rollbackFor = Exception.class)
    public void reject(TaskApproveParam param, Task task) {
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskState(TaskCode.STATE_REJECT);
        BpmContextLocal.put(bpmContext);

        taskRejectHandler.rejectTalk(task);

        // 更新驳回任务的记录
        this.rejectOrBackAfter(task, param.getReason(), STATE_REJECT);
    }

    /**
     * 流程回退
     */
    @Transactional(rollbackFor = Exception.class)
    public void back(TaskApproveParam param, Task task) {
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskState(STATE_BACK);
        taskRejectHandler.flowReturn(task, param.getBackNodeId());

        // 更新回退任务的记录
        this.rejectOrBackAfter(task, param.getReason(), STATE_BACK);
    }

    /**
     * 任务回退或驳回后处理
     * @param reason 原因
     * @param result 处理结果 STATE_BACK/STATE_BACK
     */
    private void rejectOrBackAfter(Task task, String reason, String result) {
        // 更新驳回任务的记录
        List<BpmTask> tasks = bpmTaskManager.findByInstanceIdAndNodeId(task.getProcessInstanceId(),
                task.getTaskDefinitionKey());
        // 当前任务状态为驳回, 其他的为取消
        Optional<BpmTask> first = tasks.stream().filter(bpmTask -> Objects.equals(bpmTask.getTaskId(), task.getId()))
                .findFirst();
        first.ifPresent(bpmTask -> {
            bpmTask.setReason(reason).setState(result).setResult(result).setEndTime(LocalDateTime.now());
            bpmTaskManager.updateById(bpmTask);
        });
        // 其他的设置为取消
        List<BpmTask> bpmTasks = tasks.stream().filter(bpmTask -> !Objects.equals(bpmTask.getTaskId(), task.getId()))
                .peek(bpmTask -> bpmTask.setState(result).setResult(RESULT_CANCEL).setEndTime(LocalDateTime.now()))
                .collect(Collectors.toList());
        bpmTaskManager.updateAllById(bpmTasks);
        bpmEventService.taskCancel(tasks);
    }

    /**
     * 重新分配人员
     */
    public void assignee(String taskId, Long userId) {
        taskService.setAssignee(taskId, String.valueOf(userId));
    }

}
