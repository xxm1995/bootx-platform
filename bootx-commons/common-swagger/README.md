# Swagger 模块

## 功能
对Swagger进行封装，方便配置，通过Spring的动态注册Bean和数据绑定功能，在容器Bean初始化之前把`Docket`注入到Spring容器中

## 使用
1. 见示例
```yaml
# 项目配置
bootx.common:
    swagger:
      enabled: true
      version: 1.1.0
      title: bootx-platform平台单体版
      description: bootx平台单体版
      # 多模块扫描 key 为模块 value为扫描路径
      base-packages:
        payment: cn.bootx.payment
        iam: cn.bootx.iam
        baseapi: cn.bootx.baseapi
        notice: cn.bootx.notice
```