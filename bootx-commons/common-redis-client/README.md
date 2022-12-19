## RedisClient 客户端

### 功能
1. 封装`StringRedisTemplate`提供API简单的`RedisClient`操作工具类
2. 封装`Redisson`, 默认不启用

### 使用
直接注入`RedisClient`对象后就可以进行使用

```java
@Component
@RequiredArgsConstructor
public class InventoryTask {
    private final RedisClient redisClient;
}
```
