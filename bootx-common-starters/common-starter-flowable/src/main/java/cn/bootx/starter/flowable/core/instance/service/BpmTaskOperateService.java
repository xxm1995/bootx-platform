package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.starter.flowable.code.TaskCode;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.exception.TaskNotExistException;
import cn.bootx.starter.flowable.handler.TaskRejectHandler;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.bootx.starter.flowable.param.task.TaskApproveParam;
import cn.bootx.starter.flowable.param.task.TaskReturnParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * 流程任务接口
 * @author xxm
 * @date 2022/8/24 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskOperateService {
    private final TaskService taskService;
    private final BpmTaskManager bpmTaskManager;

    private final TaskRejectHandler taskRejectHandler;


    /**
     * 通过
     */
    @Transactional(rollbackFor = Exception.class)
    public void pass(TaskApproveParam param){
        // 查询到任务和扩展属性
        Task task = Optional.ofNullable(taskService.createTaskQuery().taskId(param.getTaskId()).singleResult())
                .orElseThrow(TaskNotExistException::new);
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskReason(param.getReason())
                .setTaskState(TaskCode.STATE_PASS)
                .setTaskResult(TaskCode.RESULT_PASS)
                .setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);
        taskService.complete(task.getId());
    }

    /**
     * 弃权
     */
    @Transactional(rollbackFor = Exception.class)
    public void abstain(TaskApproveParam param){
        Task task = Optional.ofNullable(taskService.createTaskQuery().taskId(param.getTaskId()).singleResult())
                .orElseThrow(TaskNotExistException::new);
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setTaskReason(param.getReason())
                .setTaskState(TaskCode.STATE_PASS)
                .setTaskResult(TaskCode.RESULT_ABSTAIN)
                .setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);
        taskService.complete(task.getId());
    }

    /**
     * 不同意
     */
    @Transactional(rollbackFor = Exception.class)
    public void notPass(TaskApproveParam param){

    }
    /**
     * 驳回
     */
    @Transactional(rollbackFor = Exception.class)
    public void reject(TaskApproveParam param){
        BpmContext bpmContext = BpmContextLocal.get();

        bpmContext.setTaskReason(param.getReason())
                .setTaskState(TaskCode.STATE_REJECT)
                .setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);

        taskRejectHandler.flowTalkBack(param.getTaskId());
    }

    /**
     * 流程回退
     */
    public void flowReturn(TaskReturnParam param){
        taskRejectHandler.flowReturn(param.getTaskId(),param.getTargetKey());
    }

    /**
     * 重新分配人员
     */
    public void assignee(String taskId, Long userId){
        taskService.setAssignee(taskId, String.valueOf(userId));
    }

}
