package cn.bootx.office.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.office.core.instance.service.BpmInstanceService;
import cn.bootx.office.param.instance.FlowInstanceParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springdoc.api.annotations.ParameterObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    public ResResult<Void> start(@ParameterObject FlowInstanceParam instanceParam){
        bpmInstanceService.start(instanceParam);
        return Res.ok();
    }
}
