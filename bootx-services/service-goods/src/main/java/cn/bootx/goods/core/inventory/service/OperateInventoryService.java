package cn.bootx.goods.core.inventory.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.goods.core.inventory.manager.InventoryManager;
import cn.bootx.goods.core.inventory.manager.InventoryTokenContainer;
import cn.bootx.goods.core.sku.dao.GoodsSkuManager;
import cn.bootx.goods.core.sku.entity.GoodsSku;
import cn.bootx.goods.dto.inventory.LockInventoryDto;
import cn.bootx.goods.exception.inventory.InventoryNotFoundException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 库存操作
 * @author xxm
 * @date 2021/2/7
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OperateInventoryService {
    private final InventoryTokenContainer tokenContainer;

    private final GoodsSkuManager skuManager;
    private final InventoryManager inventoryManager;

    /**
     * 预占指定 SKU 的库存，返回授权码，需要在调用释放或扣减库存API时使用
     * 使用分布式事务
     */
    @Transactional(rollbackFor = Exception.class)
    public LockInventoryDto lockInventory(Long skuId, int count) {
        if (count < 1){
            throw new BizException("要锁定的库存不得小于1");
        }

        LockInventoryDto result = new LockInventoryDto();
        result.setCount(count);
        GoodsSku sku = skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);

        inventoryManager.lockInventory(skuId, count);

        result.setStartIndex(sku.getLocked() + sku.getSold() + 1);
        // 记录锁定数和过期时间
        result.setToken(tokenContainer.saveAndGetToken(skuId, count));
        return result;
    }

    /**
     * 释放指定的 SKU 的库存，需要使用预占库存时分配的 token
     */
    @Transactional(rollbackFor = Exception.class)
    public void unlockInventory(Long skuId, int count, String token) {
        // 解锁库存
        this.unlockInventoryWithoutToken(skuId, count);
        tokenContainer.consumeInventory(skuId, count, token);
    }

    /**
     * 解锁没有令牌的库存
     */
    @Transactional(rollbackFor = Exception.class)
    public void unlockInventoryWithoutToken(Long skuId, int count) {
        skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        // 自身处理
        inventoryManager.unlockInventory(skuId, count);
    }

    /**
     * 扣减指定的 SKU 的库存，需要使用预占库存时分配的 token
     */
    @Transactional(rollbackFor = Exception.class)
    public void reduceInventory(Long skuId, int count, String token) {
        skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        inventoryManager.reduceInventory(skuId, count);
        tokenContainer.consumeInventory(skuId, count, token);
    }

    /**
     * 增补指定 SKU 的可售库存， 扣减对应售出
     */
    @Transactional(rollbackFor = Exception.class)
    public void increaseInventory(Long skuId, int count) {
        skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        inventoryManager.increaseInventory(skuId, count);
    }

    /**
     * 增补指定 SKU 的可售库存
     */
    @Transactional(rollbackFor = Exception.class)
    public void increaseAvailable(Long skuId, int count) {
        skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        inventoryManager.increaseAvailable(skuId, count);
    }

    /**
     * 扣减指定 SKU 的预占库存并减少总库存
     */
    @Transactional(rollbackFor = Exception.class)
    public void reduceLockedAndCapacity(Long skuId, int count, String token) {
        skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        tokenContainer.consumeInventory(skuId, count, token);
        inventoryManager.reduceLockedAndCapacity(skuId, count);
    }

    /**
     * 扣减指定 SKU 的售出库存并减少总库存
     */
    @Transactional(rollbackFor = Exception.class)
    public void reduceSoldAndCapacity(Long skuId, int count) {
        skuManager.findById(skuId).orElseThrow(InventoryNotFoundException::new);
        inventoryManager.reduceSoldAndCapacity(skuId, count);
    }
}