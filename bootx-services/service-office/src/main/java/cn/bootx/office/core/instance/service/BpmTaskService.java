package cn.bootx.office.core.instance.service;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.office.param.instance.BpmTaskApproveParam;
import cn.bootx.starter.auth.util.SecurityUtil;
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

    /**
     * 获取自己的代办任务
     */
    public void pageMyTodo(PageParam pageParam){
        // 查询待办任务
        TaskQuery taskQuery = taskService.createTaskQuery().taskAssignee(String.valueOf(SecurityUtil.getUserId())) // 分配给自己
                .orderByTaskCreateTime().desc(); // 创建时间倒序
        List<Task> tasks = taskQuery.listPage(pageParam.start(),pageParam.getSize());
        System.out.println(tasks);
    }

    /**
     * 获取自己已处理的任务
     */
    public void pageMyDone(PageParam pageParam){
        // 查询已办任务
        HistoricTaskInstanceQuery taskQuery = historyService.createHistoricTaskInstanceQuery().finished()
                .taskAssignee(String.valueOf(SecurityUtil.getUserId()))
                .orderByHistoricTaskInstanceStartTime().desc();
        List<HistoricTaskInstance> tasks = taskQuery.listPage(pageParam.start(),pageParam.getSize());

    }

    /**
     * 通过
     */
    @Transactional(rollbackFor = Exception.class)
    public void pass(BpmTaskApproveParam param){
        // 查询到任务和扩展属性
        Task task = taskService.createTaskQuery().taskId(param.getTaskId()).singleResult();


        taskService.complete(task.getId());
    }
    /**
     * 驳回
     */
    public void reject(BpmTaskApproveParam param){
        Task task = taskService.createTaskQuery().taskId(param.getTaskId()).singleResult();

    }

    /**
     * 重新分配人员
     */
    public void assignee(){
    }
}
