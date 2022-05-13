package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.goods.core.category.service.SpecificationService;
import cn.bootx.goods.dto.category.SpecificationDto;
import cn.bootx.goods.param.category.SpecificationParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 规格
 * @author xxm
 * @date 2022-05-09
 */
@Tag(name ="规格")
@RestController
@RequestMapping("/specification")
@RequiredArgsConstructor
public class SpecificationController {
    private final SpecificationService specificationService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<Void> add(@RequestBody SpecificationParam param){
        specificationService.add(param);
        return Res.ok();
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<SpecificationDto> update(@RequestBody SpecificationParam param){
        return Res.ok(specificationService.update(param));
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        specificationService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<SpecificationDto> findById(Long id){
        return Res.ok(specificationService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<SpecificationDto>> findAll(){
        return Res.ok(specificationService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<SpecificationDto>> page(PageParam pageParam, SpecificationParam specificationParam){
        return Res.ok(specificationService.page(pageParam,specificationParam));
    }
}