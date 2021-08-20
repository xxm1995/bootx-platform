# Bootx-Platform 

单体开发脚手架，针对单体式应用进行专门设计，对应分布式项目地址 [Bootx-Cloud](https://gitee.com/bootx/bootx-cloud)

## 模块文档导航

- [common核心包](bootx-common-core/README.md)
- [commons工具配置封装](bootx-commons/README.md)
  - [缓存配置](bootx-commons/common-cache/README.md)
  - [异常处理器](bootx-commons/common-exception-handler/README.md)
  - [请求头工具](bootx-commons/common-header-holder/README.md)
  - [幂等处理器](bootx-commons/common-idempotency/README.md)
  - [JackSon配置](bootx-commons/common-jackson/README.md)
  - [日志扩展](bootx-commons/common-log/README.md)
  - [mybatis-plus扩展](bootx-commons/common-mybatis-plus/README.md)
  - [Redis客户端封装](bootx-commons/common-redis-client/README.md)
  - [sequence序列生成器](bootx-commons/common-sequence/README.md)
  - [Spring功能扩展](bootx-commons/common-spring/README.md)
  - [Swagger扩展](bootx-commons/common-swagger/README.md)
  - [定时任务xxl-job](bootx-commons/common-xxl-job/README.md)
- [starters功能封装](bootx-common-starters/README.md)
  - [认证封装模块](bootx-common-starters/common-starter-auth/README.md)
- [预置服务模块](bootx-services/README.md)
  - [基础API](bootx-services/service-baseapi/README.md)
  - [IAM身份识别与访问管理](bootx-services/service-iam/README.md)
  - [通知中心](bootx-services/service-notice/README.md)
  - [支付中心](bootx-services/service-payment/README.md)
  - [商品中心](bootx-services/service-goods/README.md)
  - [销售中心](bootx-services/service-sales/README.md)
  - [订单中心](bootx-services/service-order/README.md)

- [启动模块](bootx-start/README.md)

## 项目开发结构说明(推荐)


**模块分包设计**

以`service-iam`举例
```lua
service-iam 
    ├── code -- 常量包
    ├── controller -- 控制器
    ├── core -- 功能核心
    ├── dto -- 业务对象
    ├── mq -- 消息通知处理
    ├── task -- 定时任务
    ├── param -- 请求参数包
    ├── IamApplication -- 启动类
```
**core核心包分包**

```lua
├───code 
    ├── business -- 业务模块
        ├── convert -- 实体类转换
        ├── dao -- 持久化类
        ├── entity -- 数据库实体
        ├── service -- 服务类
```

**Core包开发设计**

项目使用MyBatis-Plus作为持久层框架，Mapper继承BaseMapper类，这个属于必须创建的，否则MyBatis-Plus无法进行拥有基础CRUD功能
```java
@Mapper
public interface UserInfoMapper extends BaseMapper<UserInfo> {

}
```
推荐创建`Manager`对像来隔离对数据库的操作，通过`Manager`继承`BaseManager`对象，来获取操作数据的能力，`BaseManager` 类似mp的`ServiceImpl`对象，针对项目做了优化，Api风格类似Jpa，
如果不习惯可以继续使用`ServiceImpl`。如果简单快速一次性项目的话，可以省略`Manager`层，直接通过`Service`继承获取操作数据库的能力。
```java
@Repository
@RequiredArgsConstructor
public class UserInfoManager extends BaseManager<UserInfoMapper,UserInfo> {
    
}
```
Server直接创建出对象并由其它Service引用，不再创建一个一对一的接口（service/impl模式），简化代码结构，开发和Debug时跳转也舒服不少。
在service类有对应接口时，Spring会对类通过动态代理增强，没有对应接口的时候就会通过CGLIB进行增强，在不使用native编译情况下，我们使用CGLIB没有任何问题，而且我们项目也无法支持native编译，

```java
@Service
@RequiredArgsConstructor
public class UserInfoService {
    // 推荐使用构造器注入，尽量避免循环依赖，出现循环依赖95%是设计出了问题
    private final XxxService xxxService;
    
}
```
## 快速上手
> 可以参考一下Demo示例模块
1. 下载后端代码到本地，使用IDEA打开，下载前端代码，使用Webstorm或者VsCode开打，下载依赖
2. 创建业务模块，并在pom里添加需要到依赖模块，创建一个`xxxApplication`，并添加到`spring.factories`文件中，激活自动扫描。
    ```java
    @ComponentScan
    // 推荐只扫描添加 @Mapper 注解的mapper，防止其他接口被误代理
    @MapperScan(annotationClass = Mapper.class)
    public class PaymentCenterApplication {
    
    }
    ```
   ```properties
    ## 配置自动化配置
    org.springframework.boot.autoconfigure.EnableAutoConfiguration=\
    cn.bootx.payment.PaymentApplication
   ```
3. 在`application.yml`相关文件中配置Swagger扫描，在多模块扫码中添加新创建的业务模块
```yaml
bootx:
  common:
    swagger:
      enabled: true
      version: 1.1.0
      title: bootx-platform平台单体版
      description: bootx平台单体版
      # 多模块扫码
      base-packages:
        payment: cn.bootx.payment
        iam: cn.bootx.iam
        baseapi: cn.bootx.baseapi
        notice: cn.bootx.notice
```
4. 可以在bootx-service中找到用不到的功能模块给删除了，然后在数据库删除对应的表，通过表前缀就可以找到模块对应的表



## FAQ常见问题
- 项目不全是UTF-8，导致无法无法启动

- idea启动时显示命令过长，需要在启动配置编辑中设置缩短命令行

- 打包或者maven构建时丢文件或者Excel表格构建好打开报错

- SQL执行批量插入慢，数据库连接默认不开启批量插入功能，需要手动在MySQL URL连接中开启allowMultiQueries=true批量执行功能