package cn.bootx.starter.flowable.handler.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.function.UserDetailService;
import cn.bootx.common.core.util.CollUtil;
import cn.bootx.common.core.util.LocalDateTimeUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.core.model.dao.BpmModelNodeManager;
import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.exception.ModelNodeNotExistException;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.impl.util.CommandContextUtil;
import org.flowable.engine.impl.util.TaskHelper;
import org.flowable.task.service.impl.persistence.entity.TaskEntity;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import static cn.bootx.starter.flowable.code.TaskCode.*;

/**   
 * 任务时间处理
 * @author xxm  
 * @date 2022/9/4 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskEventService {
    private final BpmModelNodeManager bpmModelNodeManager;
    private final BpmTaskManager bpmTaskManager;
    private final BpmInstanceManager bpmInstanceManager;
    private final UserDetailService userDetailService;

    // 正常执行的状态
    private final List<String> normalTaskStates = CollUtil.newArrayList(
            null,"",STATE_PROCESS,STATE_PASS
    );

    /**
     * 任务创建处理
     */
    public void taskCreated(TaskEntity task){
        BpmContext bpmContext = BpmContextLocal.get();
        BpmInstance bpmInstance = bpmInstanceManager.findByInstanceId(task.getProcessInstanceId()).orElse(new BpmInstance());
        BpmModelNode modelTask = bpmModelNodeManager.findByDefIdAndTaskId(task.getProcessDefinitionId(), task.getTaskDefinitionKey())
                .orElseThrow(ModelNodeNotExistException::new);

        BpmTask bpmTask = this.convert(task, bpmInstance);
        // 是否跳过该节点, 且是正常情况下
        if (modelTask.isSkip() && normalTaskStates.contains(bpmContext.getTaskState())){
            TaskHelper.completeTask(task,null,null,null,null, CommandContextUtil.getCommandContext());
            bpmTask.setState(STATE_SKIP)
                    .setEndTime(LocalDateTime.now());
        }

        // 是否分配了用户
        if (StrUtil.isNotBlank(task.getAssignee())){
            UserDetail userDetail = userDetailService.findByUserId(Long.valueOf(task.getAssignee())).orElse(new UserDetail());
            bpmTask.setUserId(userDetail.getId()).setUserName(userDetail.getName());
        }

        bpmTaskManager.save(bpmTask);
    }

    /**
     * 任务完成
     */
    public void taskCompleted(TaskEntity task){
        Optional<BpmTask> bpmTaskOpt = bpmTaskManager.findByInstanceIdAndTaskId(task.getProcessInstanceId(), task.getId());
        BpmContext bpmContext = BpmContextLocal.get();
        bpmTaskOpt.ifPresent(bpmTask -> {
            bpmTask.setEndTime(LocalDateTime.now())
                    .setState(bpmContext.getTaskState())
                    .setReason(bpmContext.getTaskReason())
                    .setFormVariables(bpmContext.getFormVariables());
            bpmTaskManager.updateById(bpmTask);
        });
    }

    /**
     * 任务人员分配
     */
    public void taskAssigned(TaskEntity task){
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

    /**
     * 转换
     */
    private BpmTask convert(TaskEntity task, BpmInstance bpmInstance){
        return new BpmTask()
                .setTaskId(task.getId())
                .setTaskNodeId(task.getTaskDefinitionKey())
                .setTaskName(task.getName())
                .setState(STATE_PROCESS)
                .setFormVariables(task.getCaseVariables())
                .setExecutionId(task.getExecutionId())
                .setInstanceId(task.getProcessInstanceId())
                .setInstanceName(bpmInstance.getInstanceName())
                .setDefName(bpmInstance.getDefName())
                .setStartUserId(bpmInstance.getStartUserId())
                .setStartUserName(bpmInstance.getStartUserName())
                .setStartTime(LocalDateTimeUtil.of(task.getCreateTime()));
    }
}
