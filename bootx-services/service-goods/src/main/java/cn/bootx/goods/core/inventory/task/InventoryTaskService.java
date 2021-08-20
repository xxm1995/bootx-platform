package cn.bootx.goods.core.inventory.task;

import cn.bootx.goods.core.inventory.dao.InventoryTokenRepository;
import cn.bootx.goods.core.inventory.manager.InventoryTokenManager;
import cn.bootx.goods.core.inventory.service.OperateInventoryService;
import cn.bootx.goods.exception.inventory.InventoryLockInsufficientException;
import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.map.MapUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * 库存任务 token 过期处理服务
 * @author xxm
 * @date 2021/2/12
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class InventoryTaskService {

    private final OperateInventoryService inventoryService;
    private final InventoryTokenManager tokenManager;

    /**
     * 释放过期
     */
    public void expireTokens(){
        // 1，获取所有过期的 token 对应的 key
        Set<String> keys = tokenManager.retrieveExpiredTokenKeys();
        if (!CollUtil.isEmpty(keys)) {
            // 2，获取过期 key 预占的 sku 库存数
            Map<String, InventoryTokenRepository.KeysCountPair> skuIdCountMap = tokenManager.extractSkuIdCountMap(keys);
            if (!MapUtil.isEmpty(skuIdCountMap)) {
                Set<String> skuIdSet = skuIdCountMap.keySet();
                // 3，释放 sku 的库存
                for (String skuId : skuIdSet) {
                    int count = skuIdCountMap.get(skuId).getCount();
                    List<String> keyList = skuIdCountMap.get(skuId).getKeys();
                    log.info("到期Tokens解锁 skuId={} 数量= {}",skuId, count);
                    try {
                        if (count > 0) {
                            inventoryService.unlockInventoryWithoutToken(Long.parseLong(skuId), count);
                        }
                        // 4，移除过期的 token 对应的 key
                        tokenManager.removeExpiredTokenKeys(keyList);
                    } catch (InventoryLockInsufficientException ex) {
                        log.error("过期 skuId 或 打包SkuId:=" + skuId + " " + ex.getMessage(), ex);
                    }
                }
            }
        }
    }
}
