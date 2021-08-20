package cn.bootx.goods.core.inventory.dao;

import cn.bootx.common.redis.RedisClient;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.*;
import java.util.stream.Collectors;

/**
 * 用于对库存操作 token 的存取管理
 * 在 Redis 中每一个 token 对应一个键为 sku:lock:{skuId}:{token} 的字符串，值为预占库存数。
 * @author xxm
 * @date 2020/11/23
 */
@Component
@RequiredArgsConstructor
public class InventoryTokenRepository {

    private static final String SPLITTER = ":";

    private static final String KEY_PREFIX = "sku" + SPLITTER + "lock" + SPLITTER;

    private final RedisClient redisClient;

    /**
     * 根据 token 存储对应的库存数，返回 token 对应的 Redis 键
     */
    public String storeByToken(Long skuId, String token, int count) {
        String key = buildKey(skuId, token);
        redisClient.set(key, String.valueOf(count));
        return key;
    }

    /**
     * 根据 token 获取对应的库存数
     */
    public int retrieveByToken(Long skuId, String token) {
        String key = buildKey(skuId, token);
        String value = redisClient.get(key);
        return StrUtil.isEmpty(value) ? 0 : Integer.parseInt(value);
    }

    /**
     * 移除 token 相关信息
     */
    public void removeByToken(Long skuId, String token) {
        String key = buildKey(skuId, token);
        redisClient.deleteKey(key);
    }

    /**
     * 根据 token 对应的 key 进行处理，对相同 sku 的预占库存数进行合计
     *
     * @return Map，key 为 skuId，value 为（预占库存总数和相关 token 列表）对象
     */
    public Map<String, KeysCountPair> extractSkuIdCountMap(List<String> keys) {
        Map<String, KeysCountPair> skuIdCountMap = new HashMap<>(keys.size());
        if (!CollectionUtil.isEmpty(keys)) {
            Set<String> skuIdSet = extractSkuIds(keys);
            // 先批量取回所有 key 的值，值的顺序与 keys 的顺序是一致的
            List<String> countList = redisClient.get(keys);

            for (String skuId : skuIdSet) {
                int count = 0;
                List<String> keyList = new ArrayList<>(keys.size());

                for (int i = 0; i < keys.size(); i++) {
                    String key = keys.get(i);
                    if (key.contains(skuId)) {
                        String value = countList.get(i);
                        count += (value == null ? 0 : Integer.parseInt(value));
                        keyList.add(key);
                    }
                }

                skuIdCountMap.put(skuId, new KeysCountPair(count, keyList));
            }
        }
        return skuIdCountMap;
    }

    /**
     * 按键计数对
     */
    @Getter
    @AllArgsConstructor
    public static class KeysCountPair {
        /** 数量 */
        private final int count;
        /** 预占库存key */
        private final List<String> keys;
    }

    /**
     * 提取skuIds
     */
    private Set<String> extractSkuIds(Collection<String> keys) {
        return keys.stream().map(this::extractSkuId).collect(Collectors.toSet());
    }

    /**
     * 提取SkuId
     */
    private String extractSkuId(String key) {
        return key.split(SPLITTER)[2];
    }

    /**
     * 移除指定的 key
     */
    public void removeByKeys(Collection<String> keys) {
        redisClient.deleteKeys(keys);
    }

    /**
     * 构建key
     */
    public String buildKey(Long skuId, String token) {
        return KEY_PREFIX + skuId + SPLITTER + token;
    }
}
