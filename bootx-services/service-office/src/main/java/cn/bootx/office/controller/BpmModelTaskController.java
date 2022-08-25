package cn.bootx.office.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.office.core.model.service.BpmModelTaskService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.flowable.bpmn.model.FlowNode;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 *
 * @author xxm
 * @date 2022/8/25
 */
@Tag(name = "流程模型任务节点管理")
@RestController
@RequestMapping("/bpm/model/task")
@RequiredArgsConstructor
public class BpmModelTaskController {
    private final BpmModelTaskService bpmModelTaskService;


    @Operation(summary = "查询流程各节点内容")
    @GetMapping("/getFlowNodes")
    public ResResult<List<FlowNode>> getFlowNodes(Long id){
        return Res.ok(bpmModelTaskService.getFlowNodes(id));
    }

}
