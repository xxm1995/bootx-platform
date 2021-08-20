package cn.bootx.goods.core.inventory.dao;

import cn.bootx.common.redis.RedisClient;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.Set;

/**
 * 用于对库存操作 token 过期时间的管理
 * 在 Redis 中每一个 token 对应的键 sku:lock:{skuId}:{token}
 * 都存储在有序集合 sku:lock:expiredtime 里，有序集合的 score 为各 token 的过期时间。
 * @author xxm
 * @date 2020/11/23
 */
@Component
@RequiredArgsConstructor
public class InventoryTokenExpiredTimeRepository {

    private static final String KEY = "sku:lock:expiredtime";

    private final RedisClient redisClient;

    /**
     * 根据 token 存储对应的 ExpiredTokenKey
     */
    public void store(String key, long expiredTime) {
        redisClient.zadd(KEY, key, expiredTime);
    }

    /**
     * 获取所有已过期的ExpiredTokenKey
     */
    public Set<String> retrieveExpiredKeys(long deadline) {
        return redisClient.zrangeByScore(KEY, 0L, deadline);
    }

    /**
     * 删除指定的ExpiredTokenKey
     */
    public void removeKeys(String... keys) {
        if (keys != null && keys.length > 0) {
            redisClient.zremByMembers(KEY, keys);
        }
    }
}
