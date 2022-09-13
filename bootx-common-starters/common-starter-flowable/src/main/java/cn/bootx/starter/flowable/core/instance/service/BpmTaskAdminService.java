package cn.bootx.starter.flowable.core.instance.service;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.bootx.starter.flowable.core.instance.dao.BpmInstanceManager;
import cn.bootx.starter.flowable.dto.task.TaskInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.flowable.engine.HistoryService;
import org.flowable.engine.RuntimeService;
import org.flowable.engine.TaskService;
import org.flowable.task.api.Task;
import org.flowable.task.api.TaskQuery;
import org.flowable.task.api.history.HistoricTaskInstance;
import org.flowable.task.api.history.HistoricTaskInstanceQuery;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 流程任务管理服务
 * @author xxm
 * @date 2022/9/11 
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class BpmTaskAdminService {
    private final BpmInstanceManager bpmInstanceManager;

    private final RuntimeService runtimeService;
    private final TaskService taskService;
    private final HistoryService historyService;
    private final BpmTaskQueryService queryService;

    /**
     * 待处理任务
     */
    public PageResult<TaskInfo> pageMyTodo(PageParam pageParam){
        // 查询待办任务
        TaskQuery taskQuery = taskService.createTaskQuery()
                .orderByTaskCreateTime().desc(); // 创建时间倒序
        List<Task> tasks = taskQuery.listPage(pageParam.start(),pageParam.getSize());
        long total = taskQuery.count();
        List<String> ids = tasks.stream().map(Task::getId).collect(Collectors.toList());
        List<TaskInfo> taskInfos = queryService.convertInstanceInfo(ids);
        return new PageResult<TaskInfo>()
                .setCurrent(pageParam.getCurrent())
                .setRecords(taskInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }

    /**
     * 已处理任务
     */
    public PageResult<TaskInfo> pageMyDone(PageParam pageParam){
        // 查询已办任务
        HistoricTaskInstanceQuery taskQuery = historyService.createHistoricTaskInstanceQuery().finished()
                .taskAssignee(String.valueOf(SecurityUtil.getUserId()))
                .orderByHistoricTaskInstanceStartTime().desc();
        List<HistoricTaskInstance> tasks = taskQuery.listPage(pageParam.start(),pageParam.getSize());
        long total = taskQuery.count();
        List<String> ids = tasks.stream().map(HistoricTaskInstance::getId).collect(Collectors.toList());
        List<TaskInfo> taskInfos = queryService.convertInstanceInfo(ids);
        return new PageResult<TaskInfo>()
                .setCurrent(pageParam.getCurrent())
                .setRecords(taskInfos)
                .setSize(pageParam.getSize())
                .setTotal(total);
    }


    /**
     * 取消任务
     */
    public void cancel(){

    }


}
