# 鉴权框架封装

## 介绍
基于sa-token，为选择Spring Security原因是复杂度较高，而且OAuth2相关项目已经停止，新版还没到生产可用。原生Spring Security想用在前后端分离的情况相对来说也不方便。
Shiro的话后期会出一个实现，目前的涉及sa-token相关的依赖都未暴露出common-starter-auth模块，方便后期无感替换。

引入了 [sa-token-plugin](https://gitee.com/bootx/sa-token-plugin) 中的redis插件，替代官方的实现，配置方式见该项目的README。
## 功能
1. 提供账号密码登陆功能
2. 提供第三方登录扩展
3. 支持配置多端登录
4. 支持忽略鉴权注解`@IgnoreAuth`的功能支持
5. 提供`PasswordEncoder`密码工具类和`SecurityUtil`安全工具类

## 使用

### 相关配置

```yaml
bootx.starter.auth:
  # 盐值
  salt: salt
  # 默认密码
  defaultPassword: 123456
  # 不进行鉴权的路径
  ignoreUrls:
    - '/actuator/**'
    - '/v2/api-docs'
    - '/doc.html'
    - '/webjars/**'
```

### 实现默认的账号密码登录
通过实现 `UsernamePasswordAuthentication` 接口并注入到Spring容器中即可，见IAM模块中的`PasswordLoginHandler`实现，是否验证码以及验证码有效时间具体在实现类自己进行手动实现。

### 第三方登录实现
通过实现 `OpenIdAuthentication` 接口并注入到Spring容器中即可，见IAM模块中的`PhoneLoginHandler`和`WeChatLoginHandler`等实现

### 调用登录
`TokenEndpoint` 接收登录相关请求，通过分发到具体登录实现类进行登录，登录成功后保存Token到Redis中