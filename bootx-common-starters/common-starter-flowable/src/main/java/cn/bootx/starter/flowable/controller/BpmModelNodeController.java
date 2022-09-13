package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.dto.LabelValue;
import cn.bootx.starter.flowable.core.model.service.BpmModelNodeService;
import cn.bootx.starter.flowable.dto.model.BpmModelNodeDto;
import cn.bootx.starter.flowable.param.model.BpmModelNodeParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022-08-25
 */
@Tag(name ="模型任务节点配置")
@RestController
@RequestMapping("/bpm/model/node")
@RequiredArgsConstructor
public class BpmModelNodeController {
    private final BpmModelNodeService bpmModelNodeService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody BpmModelNodeParam param){
        bpmModelNodeService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody BpmModelNodeParam param){
        bpmModelNodeService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        bpmModelNodeService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<BpmModelNodeDto> findById(Long id){
        return Res.ok(bpmModelNodeService.findById(id));
    }

    @Operation( summary = "查询任务节点配置项")
    @GetMapping(value = "/findByDefIdAndTaskId")
    public ResResult<BpmModelNodeDto> findByDefIdAndTaskId(String defId, String nodeId){
        return Res.ok(bpmModelNodeService.findByDefIdAndTaskId(defId,nodeId));
    }

    @Operation( summary = "获取下一步节点列表")
    @GetMapping(value = "/getNextNodes")
    public ResResult<List<LabelValue>> getNextNodes(String defId, String nodeId){
        return Res.ok(bpmModelNodeService.getNextNodes(defId,nodeId));
    }

    @Operation( summary = "根据模型Id查询所有")
    @GetMapping(value = "/findAllByModelId")
    public ResResult<List<BpmModelNodeDto>> findAllByModelId(Long modelId){
        return Res.ok(bpmModelNodeService.findAllByModelId(modelId));
    }

    @Operation(summary = "同步")
    @PostMapping("/sync")
    public ResResult<Void> sync(Long modelId){
        bpmModelNodeService.sync(modelId);
        return Res.ok();
    }
}