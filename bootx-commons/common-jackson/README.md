# JackSon配置

## 功能
1. 配置Jackson序列化方式，支持`LocalDateTime`一系列Java8新增类，Long类型序列化为String防止前端精度丢失。
2. 提供JacksonUtil工具类，用于需要进行Jackson解析的场合
3. 通过`SensitiveInfo`注解，实现传送到前台数据自动脱敏