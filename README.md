# Bootx-Platform (v1.1.0-beta-1)

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-1.1.0.beta.1-success.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Author-Bootx-orange.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Spring%20Boot-2.6.7-blue.svg" alt="Downloads"/>
 <img src="https://img.shields.io/badge/license-Apache%20License%202.0-green.svg"/>
</p>

## 🙏🙏🙏 求star呀，走过路过留个star吧，非常非常感谢。🙏🙏🙏

## 🍈项目介绍

基于Spring Boot框架打造，针对单体式应用进行专门设计，提供整套服务模块，努力为打造全方位企业级开发解决方案，
致力将开源版打造成超越商业版后台管理框架的项目。前端分为vue2版和vue3版，vue2使用 [ANTD PRO VUE](https://pro.antdv.com/) 作为脚手架，vue3使用 [Vben-Admin-Next](https://vvbin.cn/doc-next/) 作为脚手架。

## 🍒文档

- 系统演示地址：[管理平台(vue2)](http://web.platform.bootx.cn/) 
- 前端项目地址：[前端项目(vue2)](https://gitee.com/bootx/bootx-platform-ui) 
- ELK日志收集：[Kibana](http://elk.dev.bootx.cn:5601/app/discove)
- 项目文档：[项目使用指南文档](https://www.yuque.com/bootx/bootx-platform/)
- 更新日志：[更新日志](./_doc/ChangeLog.md)

## 🚩特色功能演示

### 结算台支付演示
> 
> - [结算台支付演示地址](http://web.platform.bootx.cn/cashier ) 对当前的支付功能做了一个结算台的DEMO，方便进行演示和测试，支持微信、支付宝、聚合支付等方式
> - [支付记录列表](http://web.platform.bootx.cn/payment/order/payment) 支付记录列表支持关闭支付记录、退款、手动同步支付状态等功能
> - 因为当前没有对应的支付宝和微信支付的资质，所以支付宝使用的账号是沙箱账号，而微信暂时没有账号，现在只能测试支付宝和聚合支付相关的功能。
> - 扫最下方QQ群二维码，直接加群课获取支付宝沙箱账户密码进行测试

> 注: 简单支付UI设计参考过[jeepay支付演示界面](https://www.jeequan.com/demo/jeepay_cashier.html) ，因为与 [jeepay](https://gitee.com/jeequan/jeepay) 项目许可证冲突，所以没有参考和引用代码，在此感谢[jeepay](https://gitee.com/jeequan/jeepay) 项目提供的灵感和思路

![简单支付](https://oscimg.oschina.net/oscnet/up-2afe305355141ae9398e3b056052596e1f8.png "结算台.png")
![简单支付](https://oscimg.oschina.net/oscnet/up-5bc7d0b52ef2cc734798f7854c81df69cca.png "支付记录列表.png")


## 🍎特色功能
- 支持单通道支付、聚合支付、组合支付、部分和全部退款等支付功能
- 支持支付宝、微信、云闪付、现金、钱包、储值卡等多种支付方式
- 针对敏感信息，可以通过添加注解实现返回时自动脱敏
- 针对重要信息，可以通过添加注解，实现在数据库中保密存储，配合数据脱敏使用可以更好的保护系统数据的安全
- 支持多种范围的数据权限控制，如只能查看自己、只能查询指定部门、用户、可以查询全部的数据等等
- 支持嵌套查询的超级查询构造器，自动生成对应条件SQL语句
- 提供项目对应的代码生成器，方便开发
- 定制Mybatis Plus组件和插件，更方便开发
- 支持通过ELK来管理项目日志

## 🥞项目整体结构
```lua
bootx-platform 
    ├── _config -- 项目相关配置
    ├── _doc -- 项目文档
    ├── _license -- 使用外部项目对应开源协议
    ├── bootx-common-core -- 核心包
    ├── bootx-common-starters -- starter通用功能组件
       ├── common-starter-audit-log -- 审计日志模块
       ├── common-starter-auth -- 认证模块
       ├── common-starter-code-gen -- 代码生成模块
       ├── common-starter-data-perm -- 数据权限模块
       ├── common-starter-file -- 文件管理模块
       ├── common-starter-quartz -- Quartz定时任务模块
    ├── bootx-commons -- commons工具配置封装
       ├── common-cache -- 缓存配置
       ├── common-exception-handler -- 异常处理器
       ├── common-header-holder -- 请求头获取工具
       ├── common-idempotency -- 幂等控制组件
       ├── common-jackson -- Json序列化配置
       ├── common-log -- 日志配置
       ├── common-mongo -- MongoDB配置
       ├── common-mqtt -- mqtt配置
       ├── common-mybatis-plus -- Mybatis Plus扩展
       ├── common-rabbitmq -- rabbitmq消息队列
       ├── common-redis-client -- Redis客户端封装和配置
       ├── common-sequence -- 发号器（序列号生成器）
       ├── common-spring -- Spring相关配置
       ├── common-super-query -- 超级查询器
       ├── common-swagger -- swagger3配置（Spring Doc）
       ├── common-websocket  -- websocket
       ├── common-xxl-job -- XXL-JOB定时任务
    ├── bootx-demo -- demo示例模块
    ├── bootx-services -- 业务服务模块
       ├── service-baseapi -- 基础api功能服务
       ├── service-goods -- 商品中心服务(未完成)
       ├── service-iam -- 身份识别与访问管理
       ├── service-notice -- 消息通知服务(未完成)
       ├── service-office -- 办公服务(未开始)
       ├── service-order -- 订单服务(未完成)
       ├── service-payment -- 支付服务
       ├── service-sales -- 销售中心(未完成)
       ├── service-social -- 三方系统管理(未开始)
    ├── bootx-start -- 启动模块
```
## 🍇模块结构说明

**模块分包设计**

以`service-iam`举例
```lua
service-iam 
    ├── code -- 常量包
    ├── controller -- 控制器
    ├── core -- 功能核心
    ├── exception -- 异常
    ├── dto -- 业务对象
    ├── mq -- 消息通知处理
    ├── task -- 定时任务
    ├── param -- 请求参数包
    ├── util -- 内部工具包
    ├── IamApplication -- 启动类
```
**core核心包业务代码分包**

```lua
├───code 
    ├── business -- 业务模块
        ├── convert -- 实体类转换
        ├── dao -- 持久化类
        ├── entity -- 数据库实体
        ├── service -- 服务类
```

## 🍌项目展示
菜单管理
![输入图片说明](https://oscimg.oschina.net/oscnet/up-19866964c4d12e197daf9f33d51f0f30564.png)

数据权限配置
![输入图片说明](https://oscimg.oschina.net/oscnet/up-1dbbb058d0d00b0a8d36998ccf26208fc7e.png)

超级查询器
![输入图片说明](https://oscimg.oschina.net/oscnet/up-b888976cccac630663bf55cb7689ab39333.png)

支付宝支付配置
![输入图片说明](https://oscimg.oschina.net/oscnet/up-5c4fd5380463596db224c3d27329c494ace.png)

代码生成器
![输入图片说明](https://oscimg.oschina.net/oscnet/up-38cdcb4928d7495f0c73fa6eaf4f5ede6fd.png)

数据字典
![输入图片说明](https://oscimg.oschina.net/oscnet/up-3c8b4bf1483744c04f8147fc61d5dc51b95.png)

登录方式管理
![输入图片说明](https://oscimg.oschina.net/oscnet/up-6cf4a123e2c26a3db5786b2cd264d52c4d8.png)

审计日志
![输入图片说明](https://oscimg.oschina.net/oscnet/up-7ac60f7ab581abdd60c8ae2184e001361a1.png)
##  🥪 关于我们

微信扫码加入交流群，或添加微信号：`xxxx` 邀请进群


钉钉扫码加入钉钉交流群


QQ扫码加入QQ交流群
<p>

<img src="https://oscimg.oschina.net/oscnet/up-ac1a8f8221203de2b5cbc6a461a26199b95.jpg" width = "330" height = "500"/>
</p>

## 🍷License

Apache License Version 2.0

## 🥂其他

- star趋势 

[![Stargazers over time](https://whnb.wang/stars/bootx/bootx-platform)](https://whnb.wang)