# commons工具配置封装

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

## 异常处理器

### 功能

 1. 对项目异常进行统一处理，返回统一`ErrorResult`格式的`json`返回给前端，`ErrorResult`包含对应错误链路追踪ID，通过`traceId`可以定位整个错误链路
 2. 可以通过配置，来决定返回的异常是否包含详细的信息，如`SQL`执行失败的报错，默认为关闭状态，不推荐在非开发环境中打开这个选项，预防泄露敏感信息。

### 配置

```yaml
bootx.common.exception:
  # 开启后报错时将会返回给前台详细的日志
  show-full-message: true
```

## 请求头工具

### 说明

​	获取请求头中的数据，并可以在**异步与多线程**代码中获取。通过创建一个web过滤器，每次请求到来时，获取请求头的所有请求头数据存储到TTL容器（`TransmittableThreadLocal`）里，存储到TTL容器是为了在异步或者多线程代码中不丢失请求头数据，请求结束后自动清除数据。

### 对应类

- `HeaderHolder`  请求头获取工具类，用于调用获取请求头信息
- `HolderContextHolder` 请求头上下文`TTL`存储类
- `WebHeaderHolderInterceptor` web请求头过滤器

## 幂等处理器

### 说明

​	在要进行幂等控制的方法上添加 `@Idempotent` 注解，当该方法方法上重复提交时进行拦截。原理是通过创建一个`AOP`切面，在切面中拦截添加 `@Idempotent` 注解的方法，同时获取当前请求的请求头中的 `IdempotentToken` 数据，通过`redis`的`setIfAbsent`命令判断是否已经存在，存的的话抛出异常

​	实现幂等控制需要前端进行配置，前端在发送请求时，在请求头里放入 `IdempotentToken`(幂等令牌) 数据，通常在是在前端页面生命周期中创建页面时生成一个`Token`，放入到这个请求头中，重复发送请求时会被后端拦截该请求，并返回错误提示.推荐在`Controller`中的方法上使用。

### 使用

```java
@Slf4j
@Tag(name ="测试控制器")
@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class TestController {

    // 添加幂等拦截注解
    @Idempotent
    @Operation(summary = "测试")
    @GetMapping("/hello")
    public ResResult<String> hello(){
        return Res.ok("hello");
    }
}
```

## JackSon配置

### 功能

- 提供`JacksonUtil`工具类，用于需要进行`Jackson`解析的场合
- 提供 `java8` 时间序列化类，在`Jackson`序列化时对`JDK8`新增的时间类进行支持
- 提供`Long` 类型序列化为`String`类型的序列化类，处理前端长整形精度丢失问题
- 提供一个默认的`ObjectMapper`序列化配置，支持`jdk8`，`LongToString`等配置
- 提供`Jackson2ObjectMapper`相关配置（`Spring MVC`进行参数和结果转换），支持`jdk8`，`LongToString`等配置

## 日志扩展

### 功能

- 覆盖重写`SLF4J`的`MDC`，使其支持简单轻量的同步异步链路追踪功能

- 提供默认的 `logback.xml` 配置文档，提供默认的控制台输出和ELK日志收集的配置

- 支持敏感数据脱敏功能，见`SensitiveDataLogConverter`

### 说明

​	敏感数据脱敏使用需要在 `Logback`xml配置文件中配置对应的转换规则，否则脱敏处理不生效，可以见本模块提供的`logback-bootx-common.xml`默认配置。

```xml
<!-- 敏感数据脱敏 -->
<conversionRule conversionWord="msg" converterClass="cn.bootx.common.log.SensitiveDataLogConverter"/>
<conversionRule conversionWord="message" converterClass="cn.bootx.common.log.SensitiveDataLogConverter"/>
```

如果引入默认的`Logback`xml配置，需要在这条引入语句上面声明项目名称和日志存储地址，如本项目默认的日志输出文件，如果不引入而自己进行编写日志配置文件的话，可以参照`logback-bootx-common.xml`进行编写。

```xml
<configuration>
    <include resource="org/springframework/boot/logging/logback/defaults.xml"/>
    <!--项目名称-->
    <property name="appname" value="bootx-platform"/>
    <!--日志位置-->
    <property name="logdir" value="/data/logs/${appname}"/>
    <!-- 这个要放下面 -->
    <include resource="cn/bootx/common/log/logback-bootx-common.xml"/>
</configuration>
```

### 配置

对`SensitiveDataLogConverter`类的静态代码块进行修改，添加对应的过滤规则，见下图 敏感信息配置 块代码

```java
public class SensitiveDataLogConverter extends MessageConverter {
	// 过滤规则
    private static final Map<String, String> REPLACE_RULES = new HashMap<>();

    // 敏感信息配置
    static {
        // ....
        REPLACE_RULES.put("(\"cardSecurity[\\\\]*\"[\\s+]*:[\\s+]*[\\\\]*\")(.*?)([\\\\]*\")","$1****$3");
        REPLACE_RULES.put("(\"cvv[\\\\]*\"[\\s+]*:[\\s+]*[\\\\]*\")(.*?)([\\\\]*\")","$1****$3");
        REPLACE_RULES.put("(\"cardCode[\\\\]*\"[\\s+]*:[\\s+]*[\\\\]*\")(.*?)([\\\\]*\")","$1****$3");
    }

    @Override
    public String convert(ILoggingEvent event) {
        return convert(event.getFormattedMessage());
    }

    /**
     * 过滤敏感信息
     */
    private static String convert(String msg) {
        // ...
    }
}
```

## MyBatis-Plus 扩展

### 功能

- 提供`MpBaseEntity`和`MpIdEntity`对象，作为通用数据库实体类的公共父类
- 提供`BaseManager`，作为 `ServiceImpl` 的增强替代
4. 提供`MpUtils`工具类，包含获取分页方法和分页对象转换方法
5. 配置必备的插件，见`MpConfiguration`
5. 结合 `BigField`注解，提供大字段便捷方式排除
5. 配置默认ID生成策略为雪花ID方式

### 使用说明

#### 普通CURD

1. 创建数据库类，继承`MpBaseEntity`公共父类

   ```java
   @EqualsAndHashCode(callSuper = true)
   @Data
   @TableName("iam_client")
   @Accessors(chain = true)
   public class Client extends MpBaseEntity implements EntityBaseFunction<ClientDto> {
        /** 编码 */
       private String code;
   
       /** 名称 */
       private String name;
   }
   ```

2. 创建Mapper和Manager对象，`BaseManager`是替代`ServiceImpl`的实现，引入Manage对象在是为了不在Service中直接进行数据库相关操作，把数据库操作下沉到Manager层(通常放在dao层中，不单独实现)

   ```java
   @Mapper
   public interface ClientMapper extends BaseMapper<Client> {
   }
   ```

   ```java
   @Repository
   @RequiredArgsConstructor
   public class ClientManager extends BaseManager<ClientMapper, Client> {
   }
   ```

   > 在一次性项目中，为了开发简便，可以直接Service直接继承`BaseManager`，或者直接继承`ServiceImpl`都可以，不用太恪守开发规范。

#### 大字段排除

​	一般在分页或者列表查询时，是不需要查询出记录的大字段，为此提供便捷工具类，提供大字段注解`BigField` 和对应工具类，用于批量查询时排除大字段。

1. 在数据库类中的大字段加上`BigField`注解

   ```java
   public class Client extends MpBaseEntity implements EntityBaseFunction<ClientDto> {
        /** 编码 */
       private String code;
   
       /** 名称 */
       @BigField
       private String name;
   }
   ```

2. 演示`MpBigFieldHandler`快捷工具类的使用说明，需要配合`Query.select`方法进行使用，字段存在长文本注解则在查询时被排除 

   ```java
   public List<AlipayConfig> findAll() {
       return lambdaQuery()
               // MpBigFieldHandler::excludeBigField 过滤大字段
               .select(AlipayConfig.class, MpBigFieldHandler::excludeBigField)
               .list();
   }
   ```

### BaseManager 自定义CRUD 接口

#### Save

```java
// 插入一条记录
T save(T entity);
// 插入（批量）
List<T> saveAll(List<T> list);
// 插入（批量）
boolean saveBatch(Collection<T> entityList, int batchSize);
// 存在更新记录，否插入一条记录
T saveOrUpdate(T entity)
```

#### Update

```java
// 根据 ID 选择修改
T updateById(T entity);
// 根据指定字段进行更新
T updateByField(T t,SFunction<T, ?> field, Object fieldValue);
// 根据ID 批量更新
boolean updateAllById(Collection<T> entityList);
// 根据ID 批量更新
boolean updateBatchById(Collection<T> entityList, int batchSize);
```

#### Delete

```java
// 根据主键进行删除
boolean deleteById(Serializable id);
// 根据主键集合进行删除
boolean deleteByIds(Collection<? extends Serializable> idList);
// 根据指定字段值进行删除
boolean deleteByField(SFunction<T, ?> field, Object fieldValue)
```

#### Find

```java
// 根据主键查询
Optional<T> findById(Serializable id);
// 查询全部
List<T> findAll();
// 根据id集合进行查询
List<T> findAllByIds(Collection<? extends Serializable> idList);
// 根据字段查询列表
List<T> findAllByField(SFunction<T, ?> field, Object fieldValue);
// 根据字段集合查询列表
List<T> findAllByFields(SFunction<T, ?> field, Collection<? extends Serializable> fieldValues);
```

#### Page

```java
// 无条件分页查询
<E extends IPage<T>> E page(E page);
// 条件分页查询
<E extends IPage<T>> E page(E page, Wrapper<T> queryWrapper);
```

#### Count

```java
// 根据指定字段查询存在的数据数量
Integer countByField(SFunction<T, ?> field, Object fieldValue);
```

#### Existed

```java
// 判断指定id对象是否存在
boolean existedById(Serializable id);
// 根据指定字段查询是否存在数据
boolean existedByField(SFunction<T, ?> field, Object fieldValue);
// 根据指定字段查询是否存在数据 不包括传入指定ID的对象
boolean existedByField(SFunction<T, ?> field, Object fieldValue,Serializable id);
```

#### Chain

同Mybatis-Plus的`ServiceImpl`

### MpUtil 工具类

```java
// mp page转换为 PageResult 同时进行dto转换
static <T> PageResult<T> convert2PageResult(Page<? extends EntityBaseFunction<T>> page);
// page转换为 PageResult
static <T> PageResult<T> page2PageResult(Page<T> page);
// 获取分页对象 MyBatis-Plus
static <T> Page<T> getMpPage(PageParam page, Class<T> clazz);
// 获取行名称
static String getColumnName(SFunction<?,?> function);
```

