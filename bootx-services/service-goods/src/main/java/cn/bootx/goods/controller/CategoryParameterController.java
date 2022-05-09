package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
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
        return Res.ok(categoryParameterService.add(param));
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<CategoryParameterDto> update(@RequestBody CategoryParameterParam param){
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

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<CategoryParameterDto>> page(PageParam pageParam, CategoryParameterParam categoryParameterParam){
        return Res.ok(categoryParameterService.page(pageParam,categoryParameterParam));
    }
}