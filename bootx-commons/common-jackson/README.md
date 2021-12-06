
## JackSon配置

### 功能

- 提供`JacksonUtil`工具类，用于需要进行`Jackson`解析的场合
- 提供 `java8` 时间序列化类，在`Jackson`序列化时对`JDK8`新增的时间类进行支持
- 提供`Long` 类型序列化为`String`类型的序列化类，处理前端长整形精度丢失问题
- 提供一个默认的`ObjectMapper`序列化配置，支持`jdk8`，`LongToString`等配置
- 提供`Jackson2ObjectMapper`相关配置（`Spring MVC`进行参数和结果转换），支持`jdk8`，`LongToString`等配置
