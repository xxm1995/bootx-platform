package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.starter.flowable.core.model.service.BpmModelTaskService;
import cn.bootx.starter.flowable.dto.model.BpmModelTaskDto;
import cn.bootx.starter.flowable.param.model.BpmModelTaskParam;
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
@RequestMapping("/bpm/model/task")
@RequiredArgsConstructor
public class BpmModelTaskController {
    private final BpmModelTaskService bpmModelTaskService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody BpmModelTaskParam param){
        bpmModelTaskService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody BpmModelTaskParam param){
        bpmModelTaskService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        bpmModelTaskService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<BpmModelTaskDto> findById(Long id){
        return Res.ok(bpmModelTaskService.findById(id));
    }

    @Operation( summary = "根据模型Id查询所有")
    @GetMapping(value = "/findAllByModelId")
    public ResResult<List<BpmModelTaskDto>> findAllByModelId(Long modelId){
        return Res.ok(bpmModelTaskService.findAllByModelId(modelId));
    }

    @Operation(summary = "同步")
    @PostMapping("/sync")
    public ResResult<Void> sync(Long modelId){
        bpmModelTaskService.sync(modelId);
        return Res.ok();
    }
}