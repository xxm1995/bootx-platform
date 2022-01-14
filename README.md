# Bootx-Platform (v1.1.0-alpha-4)

<p>
 <img src='https://gitee.com/bootx/bootx-platform/badge/star.svg?theme=dark' alt='star'/>
 <img src="https://img.shields.io/badge/Boot%20Platform-1.1.0.alpha4-success.svg" alt="Build Status">
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
- 项目文档：[项目使用指南文档](https://www.yuque.com/bootx/bootx-platform/)
- 快速启动：[启动说明](https://www.yuque.com/bootx/bootx-platform/vpi0gn)
- 开发计划：[开发任务](./_doc/TASK.md)
- 更新日志：[更新日志](./_doc/ChangeLog.md)

## 🍎特色功能
- 针对敏感信息，可以通过注解配置实现返回时自动脱敏
- 针对重要信息，可以通过添加注解，实现在数据库中保密存储，配合数据脱敏使用可以更好的保护系统数据的安全
- 支持多种范围的数据权限控制，如只能查看自己、只能查询指定部门、用户、可以查询全部的数据等等
- 支持嵌套查询的超级查询构造器，自动生成对应条件SQL语句
- 异常时返回链路追踪id，方便错误日志追踪
- 定制Mybatis Plus组件，更方便开发

## 🥞项目整体结构
```lua
bootx-platform 
    ├── _config -- 项目相关配置
    ├── _doc -- 项目文档
    ├── _license -- 使用外部项目对应开源协议
    ├── bootx-common-core -- 核心包
    ├── bootx-common-starters -- starter通用功能组件
    ├── bootx-commons -- commons工具配置封装
    ├── bootx-demo -- demo实例模块
    ├── bootx-services -- 业务服务模块
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
    ├── dto -- 业务对象
    ├── mq -- 消息通知处理
    ├── task -- 定时任务
    ├── param -- 请求参数包
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

## 💡FAQ常见问题
- 项目不全是UTF-8，导致无法无法启动

- idea启动时显示命令过长，需要在启动配置编辑中设置缩短命令行

- 打包或者maven构建时丢文件或者Excel表格构建好打开报错

- SQL执行批量插入慢，数据库连接默认不开启批量插入功能，需要手动在MySQL URL连接中开启allowMultiQueries=true批量执行功能

## 🍌项目展示
菜单管理
![输入图片说明](https://oscimg.oschina.net/oscnet/up-19866964c4d12e197daf9f33d51f0f30564.png)

数据权限配置
![输入图片说明](https://oscimg.oschina.net/oscnet/up-1dbbb058d0d00b0a8d36998ccf26208fc7e.png)

支付报配置
![输入图片说明](https://oscimg.oschina.net/oscnet/up-5ea6c04fe29c2dfd05f386526d8ad96a08d.png)

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