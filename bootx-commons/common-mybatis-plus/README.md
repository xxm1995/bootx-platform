
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
