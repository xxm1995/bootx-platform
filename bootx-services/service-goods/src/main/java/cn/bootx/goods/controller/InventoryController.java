package cn.bootx.goods.controller;

import cn.bootx.common.core.rest.Res;
import cn.bootx.common.core.rest.ResResult;
import cn.bootx.goods.core.inventory.service.InventoryService;
import cn.bootx.goods.core.inventory.service.OperateInventoryService;
import cn.bootx.goods.dto.inventory.LockInventoryDto;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
* @author xxm
* @date 2020/11/23
*/
@Api(tags = "库存操作")
@RestController
@RequestMapping("/inventory")
@AllArgsConstructor
public class InventoryController {
    private final InventoryService inventoryService;
    private final OperateInventoryService operateInventoryService;

    @ApiOperation("获取指定 SKU 的可用库存")
    @GetMapping("/getAvailable")
    public ResResult<Integer> getAvailable(Long skuId){
        return Res.ok(inventoryService.getAvailable(skuId));
    }

    @ApiOperation("锁定库存")
    @PostMapping("/lockInventory")
    public ResResult<LockInventoryDto> lockInventory(Long skuId, int count){
        return Res.ok(operateInventoryService.lockInventory(skuId,count));
    }

    @ApiOperation("释放预占的SKU库存，需使用token")
    @PostMapping("/unlockInventory")
    public ResResult<Void> unlockInventory(Long skuId, int count, String token){
        operateInventoryService.unlockInventory(skuId,count,token);
        return Res.ok();
    }

    @ApiOperation("解锁没有令牌的库存")
    @PostMapping("/unlockInventoryWithoutToken")
    public ResResult<Void> unlockInventoryWithoutToken(Long skuId, int count){
        operateInventoryService.unlockInventoryWithoutToken(skuId,count);
        return Res.ok();
    }

    @ApiOperation("扣减指定 SKU 的预占库存，增加对应售出")
    @PostMapping("/reduceInventory")
    public ResResult<Void> reduceInventory(Long skuId, int count, String token){
        operateInventoryService.reduceInventory(skuId,count,token);
        return Res.ok();
    }

    @ApiOperation("增补指定 SKU 的可售库存， 扣减对应售出")
    @PostMapping("/increaseInventory")
    public ResResult<Void> increaseInventory(Long skuId, int count){
        operateInventoryService.increaseInventory(skuId,count);
        return Res.ok();
    }

    @ApiOperation("增补指定 SKU 的可售库存")
    @PostMapping("/increaseAvailable")
    public ResResult<Void> increaseAvailable(Long skuId, int count){
        operateInventoryService.increaseAvailable(skuId,count);
        return Res.ok();
    }

    @ApiOperation("扣减指定的 SKU 的库存")
    @PostMapping("/reduceLockedAndCapacity")
    public ResResult<Void> reduceLockedAndCapacity(Long skuId, int count, String token){
        operateInventoryService.reduceLockedAndCapacity(skuId,count,token);
        return Res.ok();
    }


    @ApiOperation("扣减指定 SKU 的售出库存并减少总库存")
    @PostMapping("/reduceSoldAndCapacity")
    public ResResult<Void> reduceSoldAndCapacity(Long skuId, int count){
        operateInventoryService.reduceSoldAndCapacity(skuId,count);
        return Res.ok();
    }
}
