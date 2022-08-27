package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.core.instance.service.BpmInstanceService;
import cn.bootx.starter.flowable.dto.instance.InstanceInfo;
import cn.bootx.starter.flowable.param.instance.InstanceStartParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.*;

/**   
 * 流程实例
 * @author xxm  
 * @date 2022/8/24 
 */
@Tag(name = "流程实例")
@RestController
@RequestMapping("/bpm/instance")
@RequiredArgsConstructor
public class BpmInstanceController {
    private final BpmInstanceService bpmInstanceService;
    
    @Operation(summary = "启动任务")
    @PostMapping("/start")
    public ResResult<Void> start(@RequestBody InstanceStartParam instanceParam){
        bpmInstanceService.start(instanceParam);
        return Res.ok();
    }

    @Operation(summary = "我发起的流程(分页)")
    @GetMapping("/pageMyApply")
    public ResResult<PageResult<InstanceInfo>> pageMyApply(@ParameterObject PageParam pageParam){
        return Res.ok(bpmInstanceService.pageMyApply(pageParam));
    }
}
