# Bootx-Platform (v1.1.0-alpha-3)

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-1.1.0.alpha3-success.svg" alt="Build Status">
 <img src="https://img.shields.io/badge/Author-Bootx-orange.svg" alt="Build Status">
 <img src="https://img.shields.io/badge/Spring%20Boot-2.5-blue.svg" alt="Downloads">
 <img src="https://img.shields.io/badge/license-Apache%20License%202.0-green.svg"/>
</p>

## 🍈项目介绍

基于Spring Boot框架打造，针对单体式应用进行专门设计，提供整套服务模块，努力为打造全方位企业级开发解决方案，
致力将开源版打造成超越商业版后台管理框架的项目。前端分为vue2版和vue3版，vue2使用 [ANTD PRO VUE](https://pro.antdv.com/) 作为脚手架，vue3使用 [Vben-Admin-Next](https://vvbin.cn/doc-next/) 作为脚手架。

## 🍒文档

- 系统演示地址：[管理平台(vue2)](http://web.platform.bootx.cn/) 、[管理平台(vue3)](http://web.platform.bootx.cn/)
- 前端项目地址：[前端项目(vue2)](https://gitee.com/bootx/bootx-platform-ui) 、[前端项目(vue3)](https://gitee.com/bootx/bootx-platform-vben)
- 项目文档：[开发文档](https://www.yuque.com/bootx/bootx-platform/)
- 快速启动：[启动文档](https://www.yuque.com/bootx/bootx-platform/vpi0gn), [QuickStart](./_doc/quickstart.md)
- 开发计划：[开发任务](./_doc/TASK.md)
- 更新日志：[更新日志](./_doc/ChangeLog.md)

特色功能
- 针对敏感信息返回返回时自动脱敏
- 支持嵌套查询的超级查询构造器，自动生成对应条件SQL语句
- 异常时返回链路追踪id，方便错误日志追踪
- 定制Mybatis Plus组件，更方便开发

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