package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.common.core.validation.ValidationGroup;
import cn.bootx.goods.core.category.service.CategoryParameterService;
import cn.bootx.goods.dto.category.CategoryParameterDto;
import cn.bootx.goods.param.category.CategoryParameterParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 类目参数
 * @author xxm
 * @date 2022-05-09
 */
@Tag(name ="类目参数")
@RestController
@RequestMapping("/categoryParameter")
@RequiredArgsConstructor
public class CategoryParameterController {
    private final CategoryParameterService categoryParameterService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<CategoryParameterDto> add(@RequestBody CategoryParameterParam param){
        ValidationUtil.validateParam(param, ValidationGroup.add.class);
        return Res.ok(categoryParameterService.add(param));
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<CategoryParameterDto> update(@RequestBody CategoryParameterParam param){
        ValidationUtil.validateParam(param,ValidationGroup.edit.class);
        return Res.ok(categoryParameterService.update(param));
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        categoryParameterService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<CategoryParameterDto> findById(Long id){
        return Res.ok(categoryParameterService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<CategoryParameterDto>> findAll(){
        return Res.ok(categoryParameterService.findAll());
    }

    @Operation( summary = "分页查询(限定类目和分组id)")
    @GetMapping(value = "/page")
    public ResResult<PageResult<CategoryParameterDto>> page(PageParam pageParam, CategoryParameterParam categoryParameterParam){
        ValidationUtil.validateParam(categoryParameterParam,ValidationGroup.query.class);
        return Res.ok(categoryParameterService.page(pageParam,categoryParameterParam));
    }

    @Operation(summary = "判断类目参数是否已经存在")
    @GetMapping("/existsByName")
    public ResResult<Boolean> existsByName(String name,Long groupId){
        return Res.ok(categoryParameterService.existsByName(name,groupId));
    }

    @Operation(summary = "判断类目参数是否已经存在(不包含自身)")
    @GetMapping("/existsByNameNotId")
    public ResResult<Boolean> existsByName(String name,Long groupId,Long id){
        return Res.ok(categoryParameterService.existsByName(name,groupId,id));
    }

}