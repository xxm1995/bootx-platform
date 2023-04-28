# Bootx-Platform (v1.2.3)

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-1.2.3-success.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Author-Bootx-orange.svg" alt="Build Status"/>
 <img src="https://img.shields.io/badge/Spring%20Boot-2.7.11-blue.svg" alt="Downloads"/>
 <img src="https://img.shields.io/badge/license-Apache%20License%202.0-green.svg"/>
</p>

## 🙏🙏🙏 求star呀，走过路过留个star吧，非常非常感谢。🙏🙏🙏

## 🍈项目介绍
> 目前Bootx-Platform的开发重点是，将核心中的业务代码剥离出子项目，作为单独系统使用，
保持脚手架核心的精简，同时对不同的业务模块也可以专门优化和适配，使其加易用和强大。

基于Spring Boot框架打造，针对单体式应用进行专门设计，提供整套服务模块，努力为打造全方位企业级开发解决方案，
致力将开源版打造成超越商业版后台管理框架的项目。

- 单体版本使用Spring Boot相关技术栈
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

## 🍁子项目
- dax-pay：开源支付系统 [Gitee地址](https://gitee.com/bootx/daxpay)
- mybatis-table-modify：数据表结构管理 [Gitee地址](https://gitee.com/bootx/mybatis-table-modify)
- bpm-plus：工作流办公平台 
- 待命名：可视化大屏

## 🛠️功能亮点

低代码可视化平台，基于`GoView`开发，可以通过托拉拽来生成常用的大屏，可以适用于需要快速开发各种数据看板的场景。
![](https://oscimg.oschina.net/oscnet/up-43cd6c0ac952c938863db303d0c2e644827.png)

集成最新版本的Flowable 6.8 工作流，并基于Bpmn.js定制流程设计器，相较于自带modeler更贴近业务和易用，通过关联动态表单可通过托拉拽实现业务审批流的业务
![](https://oscimg.oschina.net/oscnet/up-22b8de0f4951ee6165e2ae604ad77b0af44.png)

支持支付宝、微信、聚合支付、现金支付、储值卡支付、钱包，对各种支付方式抽象成策略类，通过模板模式进行串通，方便扩展新的支付方式或业务

结算台演示地址：[http://web.platform.bootx.cn/cashier](http://web.platform.bootx.cn/cashier)

![](https://oscimg.oschina.net/oscnet/up-9f0044b76071d5a7f598ceab591c5fedb02.png)

## 🍎特色功能
- 支持单通道支付、聚合支付、组合支付、部分和全部退款等支付功能
- 支持支付宝、微信、云闪付、现金、钱包、储值卡等多种支付方式
- 基于Sa-Token定制，支持对多终端、多登录方式进行分别的管理
- 支持通过微信、钉钉、企业微信等第三方开放平台进行扫码登录
- 支持站内信、微信、钉钉、企业微信、微信公众号的消息推送
- 支持微信自定义菜单、素材、消息模板等资源的管理
- 集成Flowable+Bpmn.js工作流全家桶，方便OA相关功能的开发
- 基于GoView打造低代码可视化大屏平台，快速生成各种数据展板和大屏

## 🥂 Quick Start

Spring Boot后端: [后端启动流程](https://bootx.gitee.io/doc/overview/config/项目启动.html#后端启动)

Vue2前端: [Vue2前端启动流程](https://bootx.gitee.io/doc/overview/config/%E9%A1%B9%E7%9B%AE%E5%90%AF%E5%8A%A8.html#环境准备)

Vue3后端: [Vue3前端启动流程](https://bootx.gitee.io/doc/overview/config/%E9%A1%B9%E7%9B%AE%E5%90%AF%E5%8A%A8.html#环境准备-1)

可视化大屏: [可视化大屏启动流程](https://bootx.gitee.io/doc/overview/)

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
       ├── service-visualization -- 可视化大屏管理
    ├── bootx-start -- 启动模块
```

##  🥂 Bootx 项目合集
- Bootx-Platform：单体版脚手架 [Gitee地址](https://gitee.com/bootx/bootx-platform)
- Bootx-Cloud：微服务版脚手架 [Gitee地址](https://gitee.com/bootx/bootx-cloud)
- dax-pay：开源支付系统 [Gitee地址](https://gitee.com/bootx/daxpay)
- mybatis-table-modify：数据表结构管理 [Gitee地址](https://gitee.com/bootx/mybatis-table-modify)

##  🥪 关于我们

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
