package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.SingleIdParam;
import cn.bootx.goods.core.category.service.CategoryService;
import cn.bootx.goods.dto.category.CategoryDto;
import cn.bootx.goods.dto.category.CategoryTreeNode;
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
    public ResResult<CategoryDto> addCategory(@RequestBody CategoryDto categoryDto) {
        return Res.ok(categoryService.addCategory(categoryDto));
    }

    @Operation(summary = "更新类目")
    @PostMapping("/update")
    public ResResult<CategoryDto> update(@RequestBody CategoryDto categoryDto){
        return Res.ok(categoryService.update(categoryDto));
    }

    @Operation( summary = "获取所有类目")
    @GetMapping("/all")
    public ResResult<List<CategoryDto>> findAll() {
        return Res.ok(categoryService.findAll());
    }

    @Operation( summary = "获取类目树")
    @GetMapping("/tree")
    public ResResult<List<CategoryTreeNode>> findTree() {
        return Res.ok(categoryService.findTree());
    }

    @Operation( summary = "通过 id 获取指定类目")
    @GetMapping("/id")
    public ResResult<CategoryDto> getCategory(@Parameter(description = "类目 id", required = true)
                                              @RequestParam(value = "id") Long id) {
        return Res.ok(categoryService.getById(id));
    }

    @Operation( summary = "通过 id 删除类目")
    @DeleteMapping("/delete")
    public ResResult<Void> deleteCategoryById(@RequestBody SingleIdParam param)  {
        categoryService.deleteById(param.getId());
        return Res.ok();
    }
}
