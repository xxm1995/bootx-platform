package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmTaskManager;
import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.dto.task.BpmTaskDto;
import cn.bootx.starter.flowable.dto.task.TaskInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.HistoryService;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

/**
 * 流程任务查询
 *
 * @author xxm
 * @date 2022/9/1
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskQueryService {

    private final TaskService taskService;

    private final HistoryService historyService;

    private final BpmTaskManager bpmTaskManager;

    /**
     * 获取自己的代办任务
     */
    public PageResult<TaskInfo> pageMyTodo(PageParam pageParam) {
        // 查询待办任务
        TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(String.valueOf(SecurityUtil.getUserId())) // 分配给自己
                .orderByTaskCreateTime().desc(); // 创建时间倒序
        List<Task> tasks = taskQuery.listPage(pageParam.start(), pageParam.getSize());
        long total = taskQuery.count();
        List<String> ids = tasks.stream().map(Task::getId).collect(Collectors.toList());
        List<TaskInfo> taskInfos = this.convertInstanceInfo(ids);
        return new PageResult<TaskInfo>().setCurrent(pageParam.getCurrent()).setRecords(taskInfos)
                .setSize(pageParam.getSize()).setTotal(total);
    }

    /**
     * 获取自己已处理的任务
     */
    public PageResult<TaskInfo> pageMyDone(PageParam pageParam) {
        // 查询已办任务
        HistoricTaskInstanceQuery taskQuery = historyService.createHistoricTaskInstanceQuery().finished()
                .taskAssignee(String.valueOf(SecurityUtil.getUserId())).orderByHistoricTaskInstanceStartTime().desc();
        List<HistoricTaskInstance> tasks = taskQuery.listPage(pageParam.start(), pageParam.getSize());
        long total = taskQuery.count();
        List<String> ids = tasks.stream().map(HistoricTaskInstance::getId).collect(Collectors.toList());
        List<TaskInfo> taskInfos = this.convertInstanceInfo(ids);
        return new PageResult<TaskInfo>().setCurrent(pageParam.getCurrent()).setRecords(taskInfos)
                .setSize(pageParam.getSize()).setTotal(total);
    }

    /**
     * 根据实例id查询关联的任务 历史记录显示用
     */
    public List<BpmTaskDto> findAllByInstanceId(String instanceId) {
        return ResultConvertUtil.dtoListConvert(bpmTaskManager.findAllByInstanceId(instanceId));
    }

    /**
     * 获取流程节点的分组任务信息
     */
    public Map<String, List<BpmTaskDto>> getNodeTasks(String instanceId) {
        return this.findAllByInstanceId(instanceId).stream().collect(Collectors.groupingBy(BpmTaskDto::getNodeId));
    }

    /**
     * 转换
     */
    public List<TaskInfo> convertInstanceInfo(List<String> taskIds) {
        Map<String, BpmTask> bpmTaskMap = bpmTaskManager.findAllByTaskIds(taskIds).stream()
                .collect(Collectors.toMap(BpmTask::getTaskId, Function.identity()));
        return taskIds.stream().map(taskId -> {
            BpmTask bpmTask = Optional.ofNullable(bpmTaskMap.get(taskId)).orElse(new BpmTask());
            return new TaskInfo().setTaskId(bpmTask.getTaskId()).setNodeName(bpmTask.getNodeName())
                    .setExecutionId(bpmTask.getExecutionId()).setInstanceId(bpmTask.getInstanceId())
                    .setInstanceName(bpmTask.getInstanceName()).setDefName(bpmTask.getDefName())
                    .setStartTime(bpmTask.getStartTime()).setEndTime(bpmTask.getEndTime())
                    .setStartUserId(bpmTask.getStartUserId()).setStartUserName(bpmTask.getStartUserName());
        }).collect(Collectors.toList());
    }

}
