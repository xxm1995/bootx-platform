package cn.bootx.common.redis;

import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
* redis请求类
* @author xxm
* @date 2020/4/9 15:34
*/
@RequiredArgsConstructor
public class RedisClient {

    private final StringRedisTemplate redisTemplate;

    /** 删除key */
    public void deleteKey(String key) {
        redisTemplate.delete(key);
    }

    /** 批量删除key */
    public void deleteKeys(Collection<String> keys) {
        redisTemplate.delete(keys);
    }

    /** 设置值 */
    public void set(String key, String value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /** 设置带超时时间的值 */
    public void setWithTimeout(String key, String value, long timeoutMs) {
        redisTemplate.opsForValue().set(key, value, timeoutMs, TimeUnit.MILLISECONDS);
    }

    /** 是否过期 */
    @SuppressWarnings("all")
    public boolean exists(String key) {
        return redisTemplate.hasKey(key);
    }

    /** 获取值 */
    public String get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    /** 批量获取值 */
    public List<String> get(Collection<String> keys) {
        return redisTemplate.opsForValue().multiGet(keys);
    }

    /** hash设置值 */
    public void hset(String key, String column, Object value) {
        redisTemplate.opsForHash().put(key, column, value);
    }

    /** hash获取值 */
    public Object hget(String key, String column) {
        return redisTemplate.opsForHash().get(key, column);
    }

    /** 批量设置哈希值 */
    public void hmSet(String key, Map<String, String> map) {
        redisTemplate.opsForHash().putAll(key, map);
    }

    /** 获取hash值 */
    public Map<String, String> hmGet(String key) {
        return redisTemplate.<String,String>opsForHash().entries(key);
    }

    /** ZSet 添加 */
    @SuppressWarnings("all")
    public boolean zadd(String key, String value, long score) {
        return redisTemplate.opsForZSet().add(key, value, score);
    }

    public Set<String> zrangeByScore(String key, long start, long end) {
        return redisTemplate.opsForZSet().rangeByScore(key, start, end);
    }

    public void zremRangeByScore(String key, long start, long end) {
        redisTemplate.opsForZSet().removeRangeByScore(key, start, end);
    }

    public void zremByMembers(String key, String... members) {
        redisTemplate.opsForZSet().remove(key, members);
    }

    /** 设置超时 */
    public void expire(String key, long timeoutMs) {
        redisTemplate.expire(key, timeoutMs, TimeUnit.MILLISECONDS);
    }

    /** 设置超时 */
    public void expireUnit(String key, long expire,TimeUnit timeUnit) {
        redisTemplate.expire(key, expire, timeUnit);
    }

    /** 自增 */
    public Long increment(String key, long count) {
        return redisTemplate.opsForValue().increment(key, count);
    }

    /** 重命名 */
    public void rename(String oldKey, String newKey) {
        redisTemplate.boundSetOps(oldKey).rename(newKey);
    }

    /** 不存在进行赋值 */
    public Boolean setIfAbsent(String key, String value) {
        return redisTemplate.opsForValue().setIfAbsent(key, value);
    }

    /** 不存在进行赋值,带超时 */
    public Boolean setIfAbsent(String key, String value,long timeoutMs) {
        return redisTemplate.opsForValue().setIfAbsent(key, value, timeoutMs, TimeUnit.MILLISECONDS);
    }

    /** 获取原值并赋值 */
    public String getAndSet(String key, String value) {
        return redisTemplate.opsForValue().getAndSet(key, value);
    }
}
