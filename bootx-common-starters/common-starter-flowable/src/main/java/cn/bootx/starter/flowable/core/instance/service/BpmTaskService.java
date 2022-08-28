package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.dto.task.TaskInfo;
import cn.bootx.starter.flowable.local.BpmContext;
import cn.bootx.starter.flowable.local.BpmContextLocal;
import cn.bootx.starter.flowable.param.task.TaskApproveParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.HistoryService;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * 流程任务接口
 * @author xxm
 * @date 2022/8/24 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskService {
    private final TaskService taskService;
    private final HistoryService historyService;

    private final BpmTaskManager bpmTaskManager;

    /**
     * 获取自己的代办任务
     */
    public PageResult<TaskInfo> pageMyTodo(PageParam pageParam){
        // 查询待办任务
        TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(String.valueOf(SecurityUtil.getUserId())) // 分配给自己
                .orderByTaskCreateTime().desc(); // 创建时间倒序
        List<Task> tasks = taskQuery.listPage(pageParam.start(),pageParam.getSize());
        long total = taskQuery.count();
        List<String> ids = tasks.stream().map(Task::getId).collect(Collectors.toList());
        List<TaskInfo> taskInfos = this.convertInstanceInfo(ids);
        return new PageResult<TaskInfo>()
                .setCurrent(pageParam.getCurrent())
                .setRecords(taskInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }

    /**
     * 获取自己已处理的任务
     *
     * @return
     */
    public PageResult<TaskInfo> pageMyDone(PageParam pageParam){
        // 查询已办任务
        HistoricTaskInstanceQuery taskQuery = historyService.createHistoricTaskInstanceQuery().finished()
                .taskAssignee(String.valueOf(SecurityUtil.getUserId()))
                .orderByHistoricTaskInstanceStartTime().desc();
        List<HistoricTaskInstance> tasks = taskQuery.listPage(pageParam.start(),pageParam.getSize());
        long total = taskQuery.count();
        List<String> ids = tasks.stream().map(HistoricTaskInstance::getId).collect(Collectors.toList());
        List<TaskInfo> taskInfos = this.convertInstanceInfo(ids);
        return new PageResult<TaskInfo>()
                .setCurrent(pageParam.getCurrent())
                .setRecords(taskInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }

    /**
     * 通过
     */
    @Transactional(rollbackFor = Exception.class)
    public void pass(TaskApproveParam param){
        // 查询到任务和扩展属性
        Task task = taskService.createTaskQuery().taskId(param.getTaskId()).singleResult();
        BpmContext bpmContext = BpmContextLocal.get();
        bpmContext.setReason(param.getReason())
                .setFormVariables(param.getFormVariables());
        BpmContextLocal.put(bpmContext);
        taskService.complete(task.getId());
    }
    /**
     * 驳回
     */
    public void reject(TaskApproveParam param){
        Task task = taskService.createTaskQuery().taskId(param.getTaskId()).singleResult();

    }

    /**
     * 重新分配人员
     */
    public void assignee(){

    }

    /**
     * 转换
     */
    public List<TaskInfo> convertInstanceInfo(List<String> taskIds) {
        Map<String, BpmTask> bpmTaskMap = bpmTaskManager.findAllByTaskIds(taskIds).stream().collect(Collectors.toMap(BpmTask::getTaskId, o -> o));
        return taskIds.stream().map(taskId -> {
            BpmTask bpmTask = Optional.ofNullable(bpmTaskMap.get(taskId)).orElse(new BpmTask());
            return new TaskInfo()
                    .setTaskId(bpmTask.getTaskId())
                    .setTaskName(bpmTask.getTaskName())
                    .setExecutionId(bpmTask.getExecutionId())
                    .setInstanceId(bpmTask.getInstanceId())
                    .setInstanceName(bpmTask.getInstanceName())
                    .setDefName(bpmTask.getDefName())
                    .setStartTime(bpmTask.getStartTime())
                    .setEndTime(bpmTask.getEndTime())
                    .setStartUserId(bpmTask.getStartUserId())
                    .setStartUserName(bpmTask.getStartUserName());
        }).collect(Collectors.toList());
    }
}
