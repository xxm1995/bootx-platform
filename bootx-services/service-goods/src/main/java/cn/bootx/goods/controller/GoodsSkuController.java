package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.goods.core.sku.service.GoodsSkuService;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import cn.bootx.goods.param.sku.SkuParam;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* @author xxm
* @date 2020/11/21
*/
@Api(tags = "sku操作")
@RestController
@RequestMapping("/sku")
@AllArgsConstructor
public class GoodsSkuController {
    private final GoodsSkuService goodsSkuService;

    @ApiOperation("添加商品sku")
    @PostMapping("/add")
    public ResResult<GoodsSkuDto> add(@RequestBody SkuParam skuParam){
        return Res.ok(goodsSkuService.add(skuParam));
    }

    @ApiOperation("获取sku")
    @GetMapping("/get")
    public ResResult<GoodsSkuDto> getById(Long id){
        return Res.ok(goodsSkuService.getById(id));
    }

    @ApiOperation("获取sku集合")
    @GetMapping("/findBySkuIds")
    public ResResult<List<GoodsSkuDto>> findBySkuIds(@RequestParam List<Long> skuIds){
        return Res.ok(goodsSkuService.findBySkuIds(skuIds));
    }

    @ApiOperation("根据goodsId查询")
    @GetMapping("/findByGoodsId")
    public ResResult<List<GoodsSkuDto>> findByGoodsId(Long goodsId){
        return Res.ok(goodsSkuService.findByGoodsId(goodsId));
    }

}
