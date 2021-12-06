## 异常处理器

### 功能

1. 对项目异常进行统一处理，返回统一`ErrorResult`格式的`json`返回给前端，`ErrorResult`包含对应错误链路追踪ID，通过`traceId`可以定位整个错误链路
2. 可以通过配置，来决定返回的异常是否包含详细的信息，如`SQL`执行失败的报错，默认为关闭状态，不推荐在非开发环境中打开这个选项，预防泄露敏感信息。

### 配置

```yaml
bootx.common.exception:
  # 开启后报错时将会返回给前台详细的日志
  show-full-message: true
```
