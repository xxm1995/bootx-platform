## 🍇快速上手
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


## 🥥Core包开发设计推荐

```lua
├───code 
    ├── business -- 业务模块
        ├── convert -- 实体类转换
        ├── dao -- 持久化类
        ├── entity -- 数据库实体
        ├── service -- 服务类
```

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