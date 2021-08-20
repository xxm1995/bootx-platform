package cn.bootx.goods.core.inventory.manager;

import cn.bootx.goods.code.GoodsCode;
import cn.bootx.goods.core.inventory.dao.InventoryTokenExpiredTimeRepository;
import cn.bootx.goods.core.inventory.dao.InventoryTokenRepository;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Set;

/**
 * 库存操作 Token 管理器
 * @author xxm
 * @date 2020/11/23
 */
@Component
@RequiredArgsConstructor
public class InventoryTokenManager {

    private final InventoryTokenRepository tokenRepository;
    private final InventoryTokenExpiredTimeRepository expiredTimeRepository;

    /**
     * 通过token存储预占库存数
     */
    public void storeByToken(Long skuId, String token, int count) {
        // 存储预占库存数量
        String key = tokenRepository.storeByToken(skuId, token, count);
        // 过期时间
        long expiredTime = this.calculateExpiredTime();
        expiredTimeRepository.store(key, expiredTime);
    }

    /**
     * 通过token检索预占库存数
     */
    public int retrieveByToken(Long skuId, String token) {
        return tokenRepository.retrieveByToken(skuId, token);
    }

    /**
     * 通过token重新设置预占库存数
     */
    public void resetByToken(Long skuId, String token, int count) {
        tokenRepository.storeByToken(skuId, token, count);
    }

    /**
     * 通过token删除预占库存数
     */
    public void removeByToken(Long skuId, String token) {
        tokenRepository.removeByToken(skuId, token);
    }

    /**
     * 计算过期时间
     */
    private long calculateExpiredTime() {
        return System.currentTimeMillis() + GoodsCode.INVENTORY_TOKEN_EXPIRED_TIME;
    }

    /**
     * 返回所有已过期的 预占库存数 token
     */
    public Set<String> retrieveExpiredTokenKeys() {
        long deadline = System.currentTimeMillis();
        return expiredTimeRepository.retrieveExpiredKeys(deadline);
    }

    /**
     * 根据 token 对应的 key，抽取 skuId，并合计其预占的库存总数，形成 map
     */
    public Map<String, InventoryTokenRepository.KeysCountPair> extractSkuIdCountMap(Set<String> keys) {
        return tokenRepository.extractSkuIdCountMap(new ArrayList<>(keys));
    }

    /**
     * 通过token删除 预占库存过期时间信息
     */
    public void removeExpiredTimeTokenKey(Long skuId, String token) {
        expiredTimeRepository.removeKeys(tokenRepository.buildKey(skuId,token));
    }

    /**
     * 根据 token 删除对应的 预占库存过期时间信息
     */
    public void removeExpiredTokenKeys(Collection<String> keys) {
        if (!CollUtil.isEmpty(keys)) {
            // 删除过期的 key
            tokenRepository.removeByKeys(keys);
            // 删除过期表中的数据
            expiredTimeRepository.removeKeys(keys.toArray(new String[0]));
        }
    }
}
