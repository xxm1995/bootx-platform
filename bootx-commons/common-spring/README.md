## Spring 功能扩展

### 功能
- 启用hutool的`SpringUtil`工具类，直接可以使用

- 配置线程池，并用TTL进行包装，用于异步线程中获取环境数据，如请求头信息

- 提供`@CountTime`方法计时注解，快速打印方法耗时时间
- 提供`CorsFilter`过滤器处理跨域请求，自动处理跨域问题

### 使用
#### 线程池使用说明

线程池使用时需要进行指定配置的TTL包装过的线程池，否则会发生线程变量丢失的问题，这两个线程池分别是

- `ExecutorService` asyncExecutorService
- `Executor` asyncExecutor
```java
import org.springframework.scheduling.annotation.Async;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
 
@Component
@RequiredArgsConstructor
public class TestController {
    // 执行器
    private final Executor asyncExecutor;
    // 执行器服务
    private final ExecutorService asyncExecutorService;

    // 异步方法指定线程池
    @Async("asyncExecutor")
    public void sendHtmlMail(MailMailParam mailParam) {

    }
}
```

#### 参数配置

```yaml
bootx:
  common:
    spring:
      # 开启cors跨域处理
      cors: true
      executor:
        # 线程池维护线程的最少数量
        core-pool-size: 10
        # 缓存队列容量
        max-pool-size: 50
        # 缓存队列容量
        queue-capacity: 5000
        # 保持活动秒数
        keep-alive-seconds: 60
```

### 对应类

- `CountTimeAop` 方法执行耗时记录切面
- `AsyncExecutorConfiguration` 异步线程池配配置，使用TTL容器进行包装
- `WebServletUtil` web服务器工具类，可以获取当前请求的 `HttpServletRequest` 对象
- `CorsAutoConfiguration` Cors跨域处理配置
