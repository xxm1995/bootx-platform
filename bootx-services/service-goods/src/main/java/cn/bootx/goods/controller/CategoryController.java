package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.util.ValidationUtil;
import cn.bootx.goods.core.category.service.CategoryService;
import cn.bootx.goods.dto.category.CategoryDto;
import cn.bootx.goods.dto.category.CategoryTreeNode;
import cn.bootx.goods.param.category.CategoryBrandParam;
import cn.bootx.goods.param.category.CategoryParam;
import cn.bootx.goods.param.category.CategorySpecParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author xxm
 * @date 2020/11/19
 */
@Tag(name ="类目管理")
@RestController
@RequestMapping("/category")
@AllArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;

    @Operation(summary = "增加新类目")
    @PostMapping("/add")
    public ResResult<Void> add(@RequestBody CategoryParam categoryParam) {
        ValidationUtil.validateParam(categoryParam);
        categoryService.add(categoryParam);
        return Res.ok();
    }

    @Operation(summary = "更新类目")
    @PostMapping("/update")
    public ResResult<CategoryDto> update(@RequestBody CategoryDto categoryDto){
        return Res.ok(categoryService.update(categoryDto));
    }

    @Operation( summary = "获取所有类目")
    @GetMapping("/findAll")
    public ResResult<List<CategoryDto>> findAll() {
        return Res.ok(categoryService.findAll());
    }

    @Operation(summary = "判断类目是否已经存在")
    @GetMapping("/existsByName")
    public ResResult<Boolean> existsByName(String name){
        return Res.ok(categoryService.existsByName(name));
    }

    @Operation(summary = "判断类目是否已经存在(不包含自身)")
    @GetMapping("/existsByNameNotId")
    public ResResult<Boolean> existsByName(String name,Long id){
        return Res.ok(categoryService.existsByName(name,id));
    }

    @Operation( summary = "获取类目树")
    @GetMapping("/findTree")
    public ResResult<List<CategoryTreeNode>> findTree() {
        return Res.ok(categoryService.findTree());
    }

    @Operation( summary = "通过 id 获取指定类目")
    @GetMapping("/findById")
    public ResResult<CategoryDto> findById(@Parameter(description = "类目 id", required = true)
                                              @RequestParam(value = "id") Long id) {
        return Res.ok(categoryService.findById(id));
    }

    @Operation( summary = "通过 id 删除类目")
    @DeleteMapping("/delete")
    public ResResult<Void> delete(Long id)  {
        categoryService.delete(id);
        return Res.ok();
    }
    
    @Operation(summary = "根据类目id查询关联的绑定品牌id集合")
    @GetMapping("/findBindBrandIds")
    public ResResult<List<Long>> findBindBrandIds(Long categoryId){
        return Res.ok(categoryService.findBindBrandIds(categoryId));
    }

    @Operation(summary = "绑定品牌")
    @PostMapping("/bindBrand")
    public ResResult<Void> bindBrand(@RequestBody CategoryBrandParam param){
        ValidationUtil.validateParam(param);
        categoryService.bindBrand(param);
        return Res.ok();
    }

    @Operation(summary = "根据类目id查询关联的绑定规格id集合")
    @GetMapping("/findBindSpecIds")
    public ResResult<List<Long>> findBindSpecIds(Long categoryId){
        return Res.ok(categoryService.findBindSpecIds(categoryId));
    }

    @Operation(summary = "绑定规格")
    @PostMapping("/bindSpec")
    public ResResult<Void> bindSpec(@RequestBody CategorySpecParam param){
        ValidationUtil.validateParam(param);
        categoryService.bindSpec(param);
        return Res.ok();
    }
}
