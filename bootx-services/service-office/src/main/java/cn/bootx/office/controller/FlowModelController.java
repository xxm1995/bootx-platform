package cn.bootx.office.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.office.core.model.service.FlowModelService;
import cn.bootx.office.dto.model.FlowModelDto;
import cn.bootx.office.param.model.FlowModelParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 流程模型
 * @author xxm
 * @date 2022-08-23
 */
@Tag(name ="流程模型")
@RestController
@RequestMapping("/bpm/model")
@RequiredArgsConstructor
public class FlowModelController {
    private final FlowModelService flowModelService;

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<Void> update(@RequestBody FlowModelParam param){
        flowModelService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        flowModelService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<FlowModelDto> findById(Long id){
        return Res.ok(flowModelService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<FlowModelDto>> findAll(){
        return Res.ok(flowModelService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<FlowModelDto>> page(PageParam pageParam, FlowModelParam flowModelParam){
        return Res.ok(flowModelService.page(pageParam,flowModelParam));
    }
}