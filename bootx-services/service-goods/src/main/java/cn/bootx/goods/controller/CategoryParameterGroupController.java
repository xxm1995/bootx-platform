package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.goods.core.category.service.CategoryParameterGroupService;
import cn.bootx.goods.dto.category.CategoryParameterGroupDto;
import cn.bootx.goods.param.category.CategoryParameterGroupParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 类目参数组
 * @author xxm
 * @date 2022-05-09
 */
@Tag(name ="类目参数组")
@RestController
@RequestMapping("/categoryParameterGroup")
@RequiredArgsConstructor
public class CategoryParameterGroupController {
    private final CategoryParameterGroupService categoryParameterGroupService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<CategoryParameterGroupDto> add(@RequestBody CategoryParameterGroupParam param){
        return Res.ok(categoryParameterGroupService.add(param));
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<CategoryParameterGroupDto> update(@RequestBody CategoryParameterGroupParam param){
        return Res.ok(categoryParameterGroupService.update(param));
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        categoryParameterGroupService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<CategoryParameterGroupDto> findById(Long id){
        return Res.ok(categoryParameterGroupService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<CategoryParameterGroupDto>> findAll(){
        return Res.ok(categoryParameterGroupService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<CategoryParameterGroupDto>> page(PageParam pageParam, CategoryParameterGroupParam categoryParameterGroupParam){
        return Res.ok(categoryParameterGroupService.page(pageParam,categoryParameterGroupParam));
    }
}