package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.core.instance.service.BpmTaskOperateService;
import cn.bootx.starter.flowable.core.instance.service.BpmTaskQueryService;
import cn.bootx.starter.flowable.dto.task.BpmTaskDto;
import cn.bootx.starter.flowable.dto.task.TaskInfo;
import cn.bootx.starter.flowable.param.task.TaskApproveParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * @author xxm
 * @date 2022/8/24
 */
@Tag(name = "流程任务")
@RestController
@RequestMapping("/bpm/task")
@RequiredArgsConstructor
public class BpmTaskController {

    private final BpmTaskOperateService operateService;

    private final BpmTaskQueryService queryService;

    @Operation(summary = "我的待办")
    @GetMapping("/pageMyTodo")
    public ResResult<PageResult<TaskInfo>> pageMyTodo(PageParam pageParam) {
        return Res.ok(queryService.pageMyTodo(pageParam));
    }

    @Operation(summary = "我的已办")
    @GetMapping("/pageMyDone")
    public ResResult<PageResult<TaskInfo>> pageMyDone(PageParam pageParam) {
        return Res.ok(queryService.pageMyDone(pageParam));
    }

    @Operation(summary = "处理任务")
    @PostMapping("/approve")
    public ResResult<Void> approve(@RequestBody TaskApproveParam param) {
        operateService.approve(param);
        return Res.ok();
    }

    @Operation(summary = "根据任务实例ID查询任务列表")
    @GetMapping("/findAllByInstanceId")
    public ResResult<List<BpmTaskDto>> findAllByInstanceId(String instanceId) {
        return Res.ok(queryService.findAllByInstanceId(instanceId));
    }

    @Operation(summary = "获取流程节点的分组任务信息")
    @GetMapping("/getNodeTasks")
    public ResResult<Map<String, List<BpmTaskDto>>> getNodeTasks(String instanceId) {
        return Res.ok(queryService.getNodeTasks(instanceId));
    }

    @Operation(summary = "重新分配人员")
    @PostMapping("/assignee")
    public ResResult<Void> assignee(String taskId, Long userId) {
        operateService.assignee(taskId, userId);
        return Res.ok();
    }

}
