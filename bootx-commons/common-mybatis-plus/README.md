# MyBatis-Plus 扩展

## 功能
1. 提供`MpBaseEntity`对象，作为通用实体类父类
2. 提供`BaseManager`，作为 `ServiceImpl` 的替代
3. 提供大字段排除便捷方式
4. 提供`MpUtils`工具类，包含获取分页方法和分页对象转换方法
5. 配置必备的插件，见`MpConfiguration`
6. 查询构造器

## 使用

### CRUD使用
1. 创建实体类是继承`MpBaseEntity`
2. 创建Manager层对象时继承`BaseManager`
3. 在一次性项目中不需要Manager层的时候，可以直接由Service继承`BaseManager`

### 大字段排除
在我们进行SQL查询时，如分页、列表查询等，数据表中可能会有一些大字段会影响查询结果的传输效率。对此，提供大字段注解`BigField`，用于批量查询时排除大字段。

```java
public List<AlipayConfig> page() {
    return lambdaQuery()
            // MpBigFieldHandler::excludeBigField 过滤大字段
            .select(AlipayConfig.class, MpBigFieldHandler::excludeBigField)
            .list();
}
```


### 查询构造器使用

1. 在Controller请求接收方法上的参数栏添加 `查询` 和 ``