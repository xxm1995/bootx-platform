package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.core.instance.service.BpmTaskService;
import cn.bootx.starter.flowable.dto.task.TaskInfo;
import cn.bootx.starter.flowable.param.task.TaskApproveParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**   
 *
 * @author xxm  
 * @date 2022/8/24 
 */
@Tag(name = "流程任务")
@RestController
@RequestMapping("/bpm/task")
@RequiredArgsConstructor
public class BpmTaskController {
    private final BpmTaskService bpmTaskService;

    @Operation(summary = "我的待办")
    @GetMapping("/pageMyTodo")
    public ResResult<PageResult<TaskInfo>> pageMyTodo(PageParam pageParam){
        return Res.ok(bpmTaskService.pageMyTodo(pageParam));
    }
    @Operation(summary = "我的已办")
    @GetMapping("/pageMyDone")
    public ResResult<PageResult<TaskInfo>> pageMyDone(PageParam pageParam){
        return Res.ok(bpmTaskService.pageMyDone(pageParam));
    }

    @Operation(summary = "通过任务")
    @PostMapping("/pass")
    public ResResult<Void> pass(@RequestBody TaskApproveParam param){
        bpmTaskService.pass(param);
        return Res.ok();
    }
    
    @Operation(summary = "驳回")
    @PostMapping("/reject")
    public ResResult<Void> reject(@RequestBody TaskApproveParam param){
        bpmTaskService.reject(param);
        return Res.ok();
    }

    @Operation(summary = "任务回退")
    @PostMapping("/flowReturn")
    public ResResult<Void> flowReturn(@RequestBody TaskApproveParam param){
        bpmTaskService.reject(param);
        return Res.ok();
    }

    @Operation(summary = "重新分配人员")
    @PostMapping("/assignee")
    public ResResult<Void> assignee(String taskId,Long userId){
        bpmTaskService.assignee(taskId,userId);
        return Res.ok();
    }

}
