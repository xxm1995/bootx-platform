package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.core.instance.service.BpmTaskAdminService;
import cn.bootx.starter.flowable.dto.task.TaskInfo;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**   
 * 流程任务管理服务
 * @author xxm  
 * @date 2022/9/13 
 */
@Tag(name = "")
@RestController
@RequestMapping("/bpm/admin/task")
@RequiredArgsConstructor
public class BpmTaskAdminController {
    private final BpmTaskAdminService bpmTaskAdminService;

    @Operation(summary = "待处理任务")
    @GetMapping("/pageMyTodo")
    public ResResult<PageResult<TaskInfo>> pageMyTodo(PageParam pageParam){
        return Res.ok(bpmTaskAdminService.pageMyTodo(pageParam));
    }

    @Operation(summary = "已处理任务")
    @GetMapping("/pageMyDone")
    public ResResult<PageResult<TaskInfo>> pageMyDone(PageParam pageParam){
        return Res.ok(bpmTaskAdminService.pageMyDone(pageParam));
    }
}
