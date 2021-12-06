
## 日志扩展

### 功能

- 覆盖重写`SLF4J`的`MDC`，使其支持简单轻量的同步异步链路追踪功能

- 提供默认的 `logback.xml` 配置文档，提供默认的控制台输出和ELK日志收集的配置

- 支持敏感数据脱敏功能，见`SensitiveDataLogConverter`

### 说明

​	敏感数据脱敏使用需要在 `Logback`xml配置文件中配置对应的转换规则，否则脱敏处理不生效，可以见本模块提供的`logback-bootx-common.xml`默认配置。

```xml
<!-- 敏感数据脱敏 -->
<conversionRule conversionWord="msg" converterClass="cn.bootx.common.log.SensitiveDataLogConverter"/>
<conversionRule conversionWord="message" converterClass="cn.bootx.common.log.SensitiveDataLogConverter"/>
```

如果引入默认的`Logback`xml配置，需要在这条引入语句上面声明项目名称和日志存储地址，如本项目默认的日志输出文件，如果不引入而自己进行编写日志配置文件的话，可以参照`logback-bootx-common.xml`进行编写。

```xml
<configuration>
    <include resource="org/springframework/boot/logging/logback/defaults.xml"/>
    <!--项目名称-->
    <property name="appname" value="bootx-platform"/>
    <!--日志位置-->
    <property name="logdir" value="/data/logs/${appname}"/>
    <!-- 这个要放下面 -->
    <include resource="cn/bootx/common/log/logback-bootx-common.xml"/>
</configuration>
```

### 配置

对`SensitiveDataLogConverter`类的静态代码块进行修改，添加对应的过滤规则，见下图 敏感信息配置 块代码

```java
public class SensitiveDataLogConverter extends MessageConverter {
	// 过滤规则
    private static final Map<String, String> REPLACE_RULES = new HashMap<>();

    // 敏感信息配置
    static {
        // ....
        REPLACE_RULES.put("(\"cardSecurity[\\\\]*\"[\\s+]*:[\\s+]*[\\\\]*\")(.*?)([\\\\]*\")","$1****$3");
        REPLACE_RULES.put("(\"cvv[\\\\]*\"[\\s+]*:[\\s+]*[\\\\]*\")(.*?)([\\\\]*\")","$1****$3");
        REPLACE_RULES.put("(\"cardCode[\\\\]*\"[\\s+]*:[\\s+]*[\\\\]*\")(.*?)([\\\\]*\")","$1****$3");
    }

    @Override
    public String convert(ILoggingEvent event) {
        return convert(event.getFormattedMessage());
    }

    /**
     * 过滤敏感信息
     */
    private static String convert(String msg) {
        // ...
    }
}
```
