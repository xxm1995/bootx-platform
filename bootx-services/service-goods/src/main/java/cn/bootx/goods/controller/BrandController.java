
package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.goods.core.category.service.BrandService;
import cn.bootx.goods.dto.brand.BrandDto;
import cn.bootx.goods.param.category.BrandParam;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 品牌
 * @author xxm
 * @date 2022-05-09
 */
@Tag(name ="品牌")
@RestController
@RequestMapping("/brand")
@RequiredArgsConstructor
public class BrandController {
    private final BrandService brandService;

    @Operation( summary = "添加")
    @PostMapping(value = "/add")
    public ResResult<BrandDto> add(@RequestBody BrandParam param){
        return Res.ok(brandService.add(param));
    }

    @Operation( summary = "修改")
    @PostMapping(value = "/update")
    public ResResult<BrandDto> update(@RequestBody BrandParam param){
        return Res.ok(brandService.update(param));
    }

    @Operation( summary = "删除")
    @DeleteMapping(value = "/delete")
    public ResResult<Void> delete(Long id){
        brandService.delete(id);
        return Res.ok();
    }

    @Operation( summary = "通过ID查询")
    @GetMapping(value = "/findById")
    public ResResult<BrandDto> findById(Long id){
        return Res.ok(brandService.findById(id));
    }

    @Operation( summary = "查询所有")
    @GetMapping(value = "/findAll")
    public ResResult<List<BrandDto>> findAll(){
        return Res.ok(brandService.findAll());
    }

    @Operation( summary = "分页查询")
    @GetMapping(value = "/page")
    public ResResult<PageResult<BrandDto>> page(PageParam pageParam, BrandParam brandParam){
        return Res.ok(brandService.page(pageParam,brandParam));
    }
}