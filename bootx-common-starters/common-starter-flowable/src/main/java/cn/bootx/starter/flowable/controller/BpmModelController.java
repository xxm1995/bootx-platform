package cn.bootx.starter.flowable.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.dto.LabelValue;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.starter.flowable.core.model.service.BpmModelService;
import cn.bootx.starter.flowable.dto.model.BpmModelDto;
import cn.bootx.starter.flowable.param.model.BpmModelParam;
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
public class BpmModelController {
    private final BpmModelService bpmModelService;

    @Operation(summary = "增加流程模型")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody BpmModelParam flowModelParam){
        bpmModelService.add(flowModelParam);
        return Res.ok();
    }

    @Operation(summary = "上传BPMN文件")
    @PostMapping("/uploadBpmn")
    public ResResult<Void> uploadBpmn(@RequestBody BpmModelParam bpmModelParam){
        bpmModelService.uploadBpmn(bpmModelParam);
        return Res.ok();
    }

    @Operation(summary = "上传BPMN文件")
    @PostMapping("/copy")
    public ResResult<Void> uploadBpmn(Long id){
        bpmModelService.copy(id);
        return Res.ok();
    }

    @Operation(summary = "发布")
    @PostMapping("/publish")
    public ResResult<Void> publish(Long id){
        bpmModelService.publish(id);
        return Res.ok();
    }

    @Operation(summary = "校验流程")
    @GetMapping("/verifyModel")
    public ResResult<Void> verifyModel(Long id){
        bpmModelService.verifyModel(id);
        return Res.ok();
    }

    @Operation(summary = "更新")
    @PostMapping("/update")
    public ResResult<Void> update(@RequestBody BpmModelParam param){
        bpmModelService.update(param);
        return Res.ok();
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        bpmModelService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<BpmModelDto> findById(Long id){
        return Res.ok(bpmModelService.findById(id));
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<BpmModelDto>> page(PageParam pageParam, BpmModelParam bpmModelParam){
        return Res.ok(bpmModelService.page(pageParam,bpmModelParam));
    }

    @Operation(summary = "获取生效并部署的主流程列表")
    @GetMapping("/findMainProcess")
    public ResResult<List<LabelValue>> findMainProcess(){
        return Res.ok(bpmModelService.findMainProcess());
    }

    @Operation(summary = "根据流程定义id获取模型信息")
    @GetMapping("/findByDefId")
    public ResResult<BpmModelDto> findByDefId(String defId){
        return Res.ok(bpmModelService.findByDefId(defId));
    }

}