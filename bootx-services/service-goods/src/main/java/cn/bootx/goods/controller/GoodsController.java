package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.goods.core.goods.service.GoodsService;
import cn.bootx.goods.dto.goods.GoodsDto;
import cn.bootx.goods.param.goods.GoodsParam;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Tag(name ="商品管理")
@RestController
@RequestMapping("/goods")
@AllArgsConstructor
public class GoodsController{
    private final GoodsService goodsService;

    @Operation(summary = "添加商品")
    @PostMapping("/add")
    public ResResult<GoodsDto> add(@RequestBody GoodsParam param){
        return Res.ok(goodsService.add(param));
    }

    @Operation(summary = "查询全部")
    @GetMapping("/findAll")
    public ResResult<List<GoodsDto>> findAll(){
        return Res.ok(goodsService.findAll());
    }

    @Operation(summary = "查询包含sku的详情")
    @GetMapping("/getDetails")
    public ResResult<GoodsDto> getDetails(Long id){
        return Res.ok(goodsService.getDetails(id));
    }

    @Operation(summary = "查询包含商品信息")
    @GetMapping("/findById")
    public ResResult<GoodsDto> findById(Long id){
        return Res.ok(goodsService.findById(id));
    }

    @Operation(summary = "按类目查询")
    @GetMapping("/findByCategory")
    public ResResult<List<GoodsDto>> findByCategory(Long cid){
        return Res.ok(goodsService.findByCategory(cid));
    }
}
