# Bootx-Platform (v1.2.1)

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-1.2.1-success.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Author-Bootx-orange.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Spring%20Boot-2.7.8-blue.svg" alt="Downloads"/>
 <img src="https://img.shields.io/badge/license-Apache%20License%202.0-green.svg"/>
</p>

## 🙏🙏🙏 求star呀，走过路过留个star吧，非常非常感谢。🙏🙏🙏

## 🍈项目介绍

基于Spring Boot框架打造，针对单体式应用进行专门设计，提供整套服务模块，努力为打造全方位企业级开发解决方案，
致力将开源版打造成超越商业版后台管理框架的项目。

- 单体版本使用Spring Boot相关技术栈
- 分布式版本使用Spring Cloud Alibaba技术栈
- vue2使用 [ANTD PRO VUE](https://pro.antdv.com/) 作为脚手架
- vue3使用 [Vben-Admin](https://vvbin.cn/doc-next/) 作为脚手架
- 可视化大屏使用 [Go-VIew](https://gitee.com/dromara/go-view) 作为基础框架
- 移动端使用 [Taro](https://taro.jd.com/)、[NutUI](https://nutui.jd.com/) vue3+TS为技术栈。

## 🍒文档

- 系统演示地址：[管理平台(vue2)](http://web.platform.bootx.cn/)、[管理平台(vue3)](http://v3.platform.bootx.cn/)、[可视化大屏](http://visualization.platform.bootx.cn/)
- 前端项目地址：[前端项目(vue2)](https://gitee.com/bootx/bootx-platform-ui)、[前端项目(vue3)](https://gitee.com/bootx/bootx-platform-vue3)、[可视化大屏](https://gitee.com/bootx/bootx-platform-visualization)
- 移动端项目地址：[移动端项目(taro+vue3+ts)](https://gitee.com/xucun/bootx-platform-mobile)
- 日志收集：[ELK](http://elk.dev.bootx.cn:5601/app/discove)、[PlumeLog](http://platform.dev.bootx.cn:8080/plumelog/#/)
- 项目文档：[项目文档(GITEE)](https://bootx.gitee.io/)、[项目文档(备用)](https://doc.bootx.cn/)
- 更新日志：[更新日志](./_doc/ChangeLog.md)
## 🛠️功能亮点
支持支付宝、微信、聚合支付、现金支付、储值卡支付、钱包，对各种支付方式抽象成策略类，通过模板模式进行串通，方便扩展新的支付方式或业务

结算台演示地址：[http://web.platform.bootx.cn/cashier](http://web.platform.bootx.cn/cashier)

![](https://oscimg.oschina.net/oscnet/up-9f0044b76071d5a7f598ceab591c5fedb02.png)

低代码可视化平台，基于`GoView`开发，可以通过托拉拽来生成常用的大屏，可以用上快速开打各种数据看板的场景。
![](https://oscimg.oschina.net/oscnet/up-43cd6c0ac952c938863db303d0c2e644827.png)

集成最新版本的Flowable 6.7.2 工作流，并基于Bpmn.js定制流程设计器，相较于自带modeler更贴近业务和易用，通过关联动态表单可通过托拉拽实现业务审批流的业务
![](https://oscimg.oschina.net/oscnet/up-22b8de0f4951ee6165e2ae604ad77b0af44.png)

## 🍎特色功能
- 支持单通道支付、聚合支付、组合支付、部分和全部退款等支付功能
- 支持支付宝、微信、云闪付、现金、钱包、储值卡等多种支付方式
- 基于Sa-Token定制，支持对多终端、多登录方式进行分别的管理
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
- 基于GoView打造低代码可视化大屏平台，快速生成各种数据展板或大屏

## 🚅 路线图
- 功能
  - [x] 基于`GoView`的低代码可视化大屏平台 (90%)
  - [ ] Vue3工作流功能移植除流程设计器
  - [ ] 短信通知
## 🥂 Quick Start

[后端](https://bootx.gitee.io/doc/overview/config/项目启动.html#后端启动)

Vue2前端: [Vue2前端启动流程](https://bootx.gitee.io/doc/overview/config/%E9%A1%B9%E7%9B%AE%E5%90%AF%E5%8A%A8.html#环境准备)

Vue3后端: [Vue3前端启动流程](https://bootx.gitee.io/doc/overview/config/%E9%A1%B9%E7%9B%AE%E5%90%AF%E5%8A%A8.html#环境准备-1)

可视化大屏: [可视化大屏启动流程](http://)

**中间件配置**

| 组件       | 是否必须配置 | 备注                                          |
|----------|--------|---------------------------------------------|
| MySQL    | 是      | 不设置无法启动                                     |
| Redis    | 是      | 不设置启动后无法正常使用                                |
| RabbitMQ | 否      | 支付消息通知在使用                                   |
| MongoDB  | 否      | 默认审计日志和文件管理使用持久化方式为Mono，可在配置文件中配置切换成其他持久化方式 |
| plumelog | 是      | 默认项目自带lite版plumelog，不需要额外配置中间件，直接就可以使用      |

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
       ├── common-mqtt -- mqtt配置（停用）
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
    ├── bootx-services -- 业务服务模块
       ├── service-baseapi -- 基础api功能服务
       ├── service-iam -- 身份识别与访问管理
       ├── service-notice -- 消息通知服务
       ├── service-office -- 办公服务
       ├── service-visualization 可视化大屏管理
       ├── service-payment -- 支付服务
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
├───core 
    ├── business -- 业务模块
        ├── convert -- 实体类转换
        ├── dao -- 持久化类
        ├── entity -- 数据库实体
        ├── service -- 服务类
```

## 🍌项目展示

Vue3版本管理端
![输入图片说明](https://oscimg.oschina.net/oscnet/up-f073982714da2b2151090f0c1cbf3680159.png)

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
