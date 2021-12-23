# common核心包

## 注解
- `BigField` 数据库大字段标识注解，详细使用见`common-mybatis-plus` 模块
- `CountTime` 获取程序执行时间，
- `EncryptionField` 数据库加密字段注解，详细使用见`common-starter-data-perm` 模块
- `Idempotent` 幂等性拦截注解，用于拦截前端重复提交的请求，详细见`common-idempotency`模块
  - `enable` 是否开启幂等控制
  - `timeout` 超时时间配置，单位为毫秒，默认为10秒
- `IgnoreAuth` 忽略鉴权注解，可以加在`Controller`的方法或类上，访问时不在进行鉴权，加在非`Controller`的地方无效，见 `common-starter-auth` 模块
- `Permission` 权限控制注解，可以添加到方法和类上，添加后所执行的SQL会进行数据权限相关的控制，见`common-starter-data-perm`模块
  - `dataPermScope` 启用数据范围权限控制
  - `selectField` 启用查询字段权限控制
- `OperateLog` 操作日志记录注解，`AOP`处理类自动拦截，记录对应的操作行为，见 `common-starter-audit-log`模块
  - `title`：模块名称
  - `businessType`：业务操作类型，默认为OTHER
  - `saveParam`：是否保存参数值，默认不保存
  - `saverReturn`：是否保存返回结果，默认不保存
## 常量枚举类
- `CommonCode` 公共常量
- `WebHeaderConst` web常量
- `CommonErrorCode` 公用错误码常量 `OperateLog` 配置项
- `BusinessType` 业务操作类型，是`OperateLog`中的一项配置参数
- `SensitiveType` 敏感信息脱敏类型，如密码、手机号、身份证号等
## 基础类

- `UserDetail` 用户类，只包含id、name，username三个核心属性，是`SecurityUtil`工具类返回的对象，如需要获取更详细的用户信息，需要自行查询
- `BaseDto` 基础Dto类，包含主键，创建时间，最后修改时间，版本号三个属性
- `KeyValue` kv键值对象
- `PageParam` 分页查询参数
- `SingleIdParam` 单 id 参数
- `ErrorResult` 错误响应类，业务出现异常后返回的响应类，携带链路追踪ID `trackId`，可以用于追踪整个错误的请求链路
- `ResResult` 正常响应类
- `PageResult` 分页响应类
- `Res` 返回工具类，可以快捷返回各种正常响应类

## 基础接口

`EntityBaseFunction` 数据库entity基础声明方法，实现该接口将会拥有一个转换成Dto的方法

## 公共异常

- `ErrorCodeRuntimeException` 错误码异常基类
- `FatalException` 致命异常基类，出现此异常意味着程序遇到了致命错误，无法继续执行下去，业务流程被中断
- `SystemException` 系统类异常基类，出现此异常说明系统遇到了问题
- `BizException` 业务异常基类，出现此异常说明业务出现异常，但不是致命异常，还可以继续进行运行
- `ValidationFailedException` 参数验证异常，一个业务异常的子类

## 基础工具类

- `BigDecimalUtil` 大数工具类
- `CollUtil` 集合工具类，判断两个集合是否有交集
- `LocalDateTimeUtil` `JDK8`时间工具类
- `RegexUtil` 正则验证工具类
- `ResultConvertUtil` 结果转换工具类工具类，主要用于`Dto`转换
- `StreamUtil` 流工具类，包含复制流到字符串方法
- `ValidationUtil`  属性校验工具类
  - `ValidationGroup`   属性校验分组，提供默认四种分组，分别是增删改查

## 包含依赖

- `lombok`
- `commons-lang3`
- `jackson-databind` `jackson`数据绑定
- `commons-collections4`
- `commons-text`
- `commons-codec`
- `commons-io`
- `guava` Google 出的 Guava 是Java 核心增强的库,应用非常广泛。
- `hutool` 国产工具类
- `hibernate-validator` 属性校验
- `javax.servlet-api`
- `swagger-annotations` `swagger3` 注解依赖
- `springdoc-openapi-common` `swagger3` 的实现`springdoc`框架，引入这个包是为了引入相关依赖
- `slf4j-api` 日志

