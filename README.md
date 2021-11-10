# Bootx-Platform ([前端项目](https://gitee.com/bootx/bootx-platform-ui))

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-2.0.0-success.svg" alt="Build Status">
 <img src="https://img.shields.io/badge/Author-Bootx-orange.svg" alt="Build Status">
 <img src="https://img.shields.io/badge/Spring%20Boot-2.5-blue.svg" alt="Downloads">
 <img src="https://img.shields.io/badge/license-Apache%20License%202.0-green.svg"/>
</p>

## 🍈项目介绍

基于Spring Boot框架打造，针对单体式应用进行专门设计，提供整套服务模块，努力为打造全方位企业级开发解决方案，
致力将开源版打造成超越商业版后台管理框架的项目，**分布式版实现地址 [Bootx-Cloud](https://gitee.com/bootx/bootx-platform) ，暂时先以单体为主**

功能：

1. 基础服务：用户管理、权限认证、终端管理、日志审计等
2. 通知服务：邮件通知、站内信、消息模板、短信通知等
3. 电商服务：收单支付、营销管理、商品管理、订单管理等
4. 数据服务：日志分析、数据中心等
5. 监控服务：服务监控、缓存监控、错误预警单体
6. OA办公服务：工单服务、工作流服务
7. 财务管理：待定
8. ERP：企业资源计划、待定

## 🍒文档

- 系统演示地址：[管理平台](http://web.platform.bootx.cn/)
- 前端项目地址：[前端项目](https://gitee.com/bootx/bootx-platform-ui)
- 项目文档：[开发文档](https://www.yuque.com/bootx/bootx-platform/)
- 快速启动：[启动文档](https://www.yuque.com/bootx/bootx-platform/vpi0gn), [QuickStart](./_doc/quickstart.md)
- 开发计划：[开发任务](./_doc/TASK.md)

## 🍇项目结构说明

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

## 🥞模块文档导航

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
  - [认证封装模块](bootx-common-starters/common-starter-auth-satoken/README.md)
- [预置服务模块](bootx-services/README.md)
  - [基础API](bootx-services/service-baseapi/README.md)
  - [IAM身份识别与访问管理](bootx-services/service-iam/README.md)
  - [通知中心](bootx-services/service-notice/README.md)
  - [支付中心](bootx-services/service-payment/README.md)
  - [商品中心](bootx-services/service-goods/README.md)
  - [销售中心](bootx-services/service-sales/README.md)
  - [订单中心](bootx-services/service-order/README.md)

- [启动模块](bootx-start/README.md)

## 🍇FAQ常见问题
- 项目不全是UTF-8，导致无法无法启动

- idea启动时显示命令过长，需要在启动配置编辑中设置缩短命令行

- 打包或者maven构建时丢文件或者Excel表格构建好打开报错

- SQL执行批量插入慢，数据库连接默认不开启批量插入功能，需要手动在MySQL URL连接中开启allowMultiQueries=true批量执行功能

##  🍷License

Apache License Version 2.0

## 🥂其他

- star趋势 

[![Stargazers over time](https://whnb.wang/stars/bootx/bootx-platform)](https://whnb.wang)