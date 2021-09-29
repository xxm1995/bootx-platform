# 缓存模块

## 功能

1. 配置Redis缓存所需要的序列化方式和缓存管理器，详情看 `CachingConfiguration`
2. 扩展RedisCache缓存管理器，存储null值时不报错，见 `BootxRedisCache`
3. 扩展支持无侵入的缓存过期时间配置，通过yaml中可以进行配置，过期时间为秒

## 配置

```yaml
bootx.common.cache:
  # 默认超时时间 (秒)
  defaultTtl: 60
  # 默认超时时间, kv格式, key为缓存, value为过期时间(秒)
  keysTtl:
    "[dept:tree]" : 5000
    "[user:tree]" : 6000
```

