# 鉴权框架封装模块

## 介绍
基于sa-token，为选择Spring Security原因是复杂度较高，而且OAuth2相关项目已经停止，新版还没到生产可用。原生Spring Security想用在前后端分离的情况相对来说也不方便，所以选择了Sa-Token做为安全鉴权框架。

引入了 [sa-token-plugin](https://gitee.com/bootx/sa-token-plugin) 中的redis插件，替代官方的实现，配置方式见该项目的README。
> sa-token-plugin 插件未发布到中央仓库,所以进行了内联
## 功能
- 提供账号密码登陆功能
- 提供第三方登录扩展
- 支持配置多端登录
- 支持接口添加`@IgnoreAuth`忽略鉴权注解进行跳过权限控制
- 请求接口支持通过在线配置进行权限控制
- 提供`PasswordEncoder`密码工具类和`SecurityUtil`安全工具类

## 使用

### 配置

```yaml
bootx.starter.auth:
  # 默认密码
  defaultPassword: salt
  # 盐值
  salt: 55521545
  # openId类型参数名称(第三方登录传入的参数名)
  openIdTypeParameter: openIdType
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

### 登录流程
`TokenEndpoint` 接收登录相关请求，通过分发到具体登录实现类进行登录，登录成功后保存Token到Redis中

### 请求接口权限控制

