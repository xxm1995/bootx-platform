# 幂等处理器

## 使用说明
在方法上添加 `@Idempotent` 注解，前端请求时在请求头里放入一个 `IdempotentToken` 数据，重复发送时会拦截请求，返回错误提示，推荐在Controller中的方法上使用.
通过AOP机制实现
```java
@Slf4j
@Tag(name ="测试控制器")
@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class TestController {
    private final Executor executor;

    // 添加幂等拦截注解
    @Idempotent
    @Operation(summary = "测试")
    @GetMapping("/hello")
    public ResResult<String> hello(){
        return Res.ok("hello");
    }
}
```
