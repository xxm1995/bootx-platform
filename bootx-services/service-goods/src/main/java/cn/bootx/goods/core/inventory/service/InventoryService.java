package cn.bootx.goods.core.inventory.service;

import cn.bootx.goods.core.inventory.manager.InventoryManager;
import cn.bootx.goods.core.sku.dao.GoodsSkuManager;
import cn.bootx.goods.core.sku.entity.GoodsSku;
import cn.bootx.goods.exception.inventory.InventoryNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * 库存服务
 * @author xxm
 * @date 2020/11/21
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class InventoryService {
    private final GoodsSkuManager skuManager;
    private final InventoryManager inventoryManager;

    /**
     * 获取指定 SKU 的可用库存
     */
    public Integer getAvailable(Long skuId){
        GoodsSku sku = skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        return sku.getAvailable();
    }

}
