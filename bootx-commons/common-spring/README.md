__# Spring 功能扩展

## 功能
1. 启用hutool的`SpringUtil`工具类
2. 配置线程池，并用TTL进行包装，用于异步线程中获取环境数据
3. 提供`CountTime`方法计时注解，计算方法耗时
4. 
## 使用
1. SpringUtil直接进行调用就可以
2. 提供CorsFilter过滤器处理跨域请求，已进行配置
3. 线程池使用时需要进行指定，分别是
    - ExecutorService asyncExecutorService
    - Executor asyncExecutor
    ```java
   import org.springframework.scheduling.annotation.Async;
   import java.util.concurrent.Executor;
   import java.util.concurrent.ExecutorService;
    
   @Component
   @RequiredArgsConstructor
   public class TestController {
       private final Executor asyncExecutor;
       private final ExecutorService asyncExecutorService;
   
       @Async("asyncExecutor")
       public void sendHtmlMail(MailMailParam mailParam) {
   
       }
   }
    ```
