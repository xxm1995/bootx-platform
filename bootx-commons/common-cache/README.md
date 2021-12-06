## 缓存模块

### 功能

- 配置`Redis`缓存所需要的序列化方式和缓存管理器，详情看 `CachingConfiguration`

- 扩展`RedisCache`缓存管理器，存储null值时不报错，见 `BootxRedisCache`

- 扩展支持无侵入的缓存过期时间配置，通过`yaml`中可以进行配置，过期时间为秒

### 配置

```yaml
bootx.common.cache:
  # 默认超时时间 (秒)
  default-ttl: 60
  # 默认超时时间, kv格式, key为缓存, value为过期时间(秒)
  keys-ttl:
    "[dept:tree]" : 5000
    "[user:tree]" : 6000
```

### 对应类

- `BootxRedisCache` 重写`RedisCache`实现, 缓存值为空不报错
- `BootxRedisCacheManager` 重写`Redis`缓存管理
- `CachingConfiguration` 缓存自动配置，配置了缓存管理器、Key名称生成和序列化等相关配置
- `CachingProperties` 缓存参数配置类，主要用于配置超时时间
