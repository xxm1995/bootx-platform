# Bootx-Platform (v1.1.2)

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-1.1.2-success.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Author-Bootx-orange.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Spring%20Boot-2.7.3-blue.svg" alt="Downloads"/>
 <img src="https://img.shields.io/badge/license-Apache%20License%202.0-green.svg"/>
</p>

## 🙏🙏🙏 求star呀，走过路过留个star吧，非常非常感谢。🙏🙏🙏

## 🍈项目介绍

基于Spring Boot框架打造，针对单体式应用进行专门设计，提供整套服务模块，努力为打造全方位企业级开发解决方案，
致力将开源版打造成超越商业版后台管理框架的项目。前端分为vue2版和vue3版，vue2使用 [ANTD PRO VUE](https://pro.antdv.com/) 作为脚手架，vue3使用 [Vben-Admin-Next](https://vvbin.cn/doc-next/) 作为脚手架。
移动端使用 [taro](https://taro.jd.com/) vue3+TS为技术栈。

## 🍒文档

- 系统演示地址：[管理平台(vue2)](http://web.platform.bootx.cn/)
- 前端项目地址：[前端项目(vue2)](https://gitee.com/bootx/bootx-platform-ui)
- 移动端项目地址：[移动端项目(taro+vue3+ts)](https://gitee.com/xucun/bootx-platform-mobile)
- 日志收集：[ELK](http://elk.dev.bootx.cn:5601/app/discove) [PlumeLog](http://platform.dev.bootx.cn:8080/plumelog/#/)
- 项目文档：[项目使用指南文档](https://www.yuque.com/bootx/bootx-platform/)
- 更新日志：[更新日志](./_doc/ChangeLog.md)
## 🛠️功能亮点
支持支付宝、微信、聚合支付、现金支付、储值卡支付、钱包，对各种支付方式抽象成策略类，通过模板模式进行串通，方便扩展新的支付方式或业务

结算台演示地址：[http://web.platform.bootx.cn/cashier](http://web.platform.bootx.cn/cashier)

![](https://oscimg.oschina.net/oscnet/up-9f0044b76071d5a7f598ceab591c5fedb02.png)

集成最新版本的Flowable 6.7.2 工作流，并基于Bpmn.js定制流程设计器，相较于自带modeler更贴近业务和易用，通过关联动态表单可通过托拉拽实现业务审批流的业务
![](https://oscimg.oschina.net/oscnet/up-6a021b64002a32c69c9f4c12b1c047f6b5c.png)

## 🍎特色功能
- 支持单通道支付、聚合支付、组合支付、部分和全部退款等支付功能
- 支持支付宝、微信、云闪付、现金、钱包、储值卡等多种支付方式
- 支持对多终端、多登录方式进行分别的管理
- 针对各类敏感信息，可以通过添加注解实现返回时自动脱敏
- 针对重要信息，可以通过添加注解，实现在数据库中保密存储，配合数据脱敏使用可以更好的保护系统数据的安全
- 支持多种范围的数据权限控制，如只能查看自己、只能查询指定部门、用户、可以查询全部的数据等等
- 支持嵌套查询的超级查询构造器，自动生成对应条件SQL语句，也支持普通查询器，免去大量重复代码的编写
- 提供移动端开发脚手架，方便开发H5与各种小程序
- 支持通过ELK和轻量级PlumeLog来管理项目日志,以适应不同的场景
- 支持通过微信、钉钉、企业微信等第三方开放平台进行扫码登录
- 支持站内信、微信、钉钉、企业微信、微信公众号的消息推送
- 支持微信自定义菜单、素材、消息模板等资源的管理
- 集成Flowable+Bpmn.js工作流全家桶，方便OA相关功能的开发

## 🚅 路线图
- 工作流功能完善           9 月
  - [x] 更灵活的节点用户配置，可配置发起人、指定用户、指定角色等
  - [x] 会签处理
  - [x] 串签处理
  - [ ] 或签处理
  - [ ] 会签比例通过处理
  - [ ] 驳回处理
  - [ ] 任意节点退回
  - [ ] 关联消息通知
  - [ ] 更方便与现有业务整合

- 移动端脚手架【taro TS+Vue3】       10 月
  - [x] 扩展新登录方式和管理策略
  - [ ] 消息通知
  - [ ] 任务处理
  - [ ] 个人信息管理

## 🥂 Quick Start

- 下载项目并切换到master分支，或者下载发行版后导入IDEA中，下载对应的Maven依赖
- 配置好各种必要的数据库中间件地址(见下方中间表)，直接启动项目。注：不需要导入Sql脚本到数据库中，默认启用`flyway`会自动对数据库进行初始化
- 如果使用`_config/sql`导入到数据库中的方式，则需要在项目启动前将`spring.flyway.enabled`设为`false`后启动项目，推荐使用`flyway`对数据库进行数据管理
- 后端启动启动成功，开始启动前端
- 安装依赖 `yarn install`，node版本需要12以上，推荐使用16
- 启动前端 `yarn serve`，进行访问

**中间件配置**

| 备备注注组件 | 是否必须配置 | 备注                                          |
| ------------ | ------------ |---------------------------------------------|
| MySQL        | 是           | 不设置无法启动                                     |
| Redis        | 是           | 不设置无法启动                                     |
| RabbitMQ     | 否           | 支付消息通知在使用                                   |
| MongoDB      | 否           | 默认审计日志和文件管理使用持久化方式为Mono，可在配置文件中配置切换成其他持久化方式 |
| MQTT         | 否           |                                             |
| plumelog     | 是           | 默认项目自带lite版plumelog，不需要额外配置中间件，直接就可以使用      |

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
       ├── common-starter-dingtalk -- 钉钉对接模块
       ├── common-starter-file -- 文件管理模块
       ├── common-starter-flowable -- flowable工作流模块
       ├── common-starter-monitor -- 系统监控模块
       ├── common-starter-quartz -- Quartz定时任务模块
       ├── common-starter-wechat -- 微信对接模块
       ├── common-starter-wecom -- 企业微信对接模块
    ├── bootx-commons -- commons工具配置封装
       ├── common-cache -- 缓存配置
       ├── common-exception-handler -- 异常处理器
       ├── common-header-holder -- 请求头获取工具
       ├── common-idempotency -- 幂等控制组件
       ├── common-jackson -- Json序列化配置
       ├── common-lock -- 分布式锁
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
       ├── common-websocket  -- websocket封装
       ├── common-xxl-job -- XXL-JOB定时任务
    ├── bootx-demo -- demo示例模块
    ├── bootx-modules -- 业务系统
       ├── eshop -- 网上商城
    ├── bootx-services -- 业务服务模块
       ├── service-baseapi -- 基础api功能服务
       ├── service-goods -- 商品中心服务(进行中)
       ├── service-iam -- 身份识别与访问管理
       ├── service-notice -- 消息通知服务
       ├── service-office -- 办公服务(进行中)
       ├── service-order -- 订单服务(未完成)
       ├── service-payment -- 支付服务
       ├── service-sales -- 销售中心(未完成)
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

支付结算台

![简单支付](https://oscimg.oschina.net/oscnet/up-2afe305355141ae9398e3b056052596e1f8.png)

工作流

![工作流](https://oscimg.oschina.net/oscnet/up-6a021b64002a32c69c9f4c12b1c047f6b5c.png)

微信自定义菜单

![微信自定义菜单](https://oscimg.oschina.net/oscnet/up-09e7cf13093c4b77065829582caeb6647cd.png)

动态表单

![输入图片说明](https://oscimg.oschina.net/oscnet/up-8384daeef614b3beae7641a46880273d10e.png)

邮件发送

![输入图片说明](https://oscimg.oschina.net/oscnet/up-650a65461bb5123f9055e75fcdf92c83356.png)

超级查询器

![输入图片说明](https://oscimg.oschina.net/oscnet/up-b888976cccac630663bf55cb7689ab39333.png)

富文本编辑器

![输入图片说明](https://oscimg.oschina.net/oscnet/up-1e771f954859081e4151c8333245536b64c.png)

PlumeLog 轻量级日志管理

![输入图片说明](https://oscimg.oschina.net/oscnet/up-198d0b0c09c2087e7d22506e58ae75cc536.png)

ELK日志

![输入图片说明](https://oscimg.oschina.net/oscnet/up-31d6dbbccdaf8dcfc1cad8e24c7b7f80602.png)

菜单管理

![输入图片说明](https://oscimg.oschina.net/oscnet/up-97b10943138e572258ac1cb1f31365f72db.png)

数据权限配置

![输入图片说明](https://oscimg.oschina.net/oscnet/up-1dbbb058d0d00b0a8d36998ccf26208fc7e.png)

支付宝支付配置

![输入图片说明](https://oscimg.oschina.net/oscnet/up-5c4fd5380463596db224c3d27329c494ace.png)

站内信消息通知

![输入图片说明](https://oscimg.oschina.net/oscnet/up-7019d597108f0f96910a0775bd26b542ede.png)

##  🥪 关于我们

微信扫码加入交流群，或添加微信号：`xxxx` 邀请进群


钉钉扫码加入钉钉交流群


QQ扫码加入QQ交流群
<p>

<img src="https://oscimg.oschina.net/oscnet/up-ac1a8f8221203de2b5cbc6a461a26199b95.jpg" width = "330" height = "500"/>
</p>

## 🍻 鸣谢
感谢 JetBrains 提供的免费开源 License：

[![JetBrains](https://oscimg.oschina.net/oscnet/up-4aab9fa8bc769295b48c888d93e71320d93.png)](https://www.jetbrains.com/?from=bootx)

感谢其他提供灵感和思路的开源项目

[部分参考的开源项目和开源许可列表](./_license/LICENSE.md)


## 🍷License

Apache License Version 2.0
