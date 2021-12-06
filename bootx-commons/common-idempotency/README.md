
## 幂等处理器

### 说明

​	在要进行幂等控制的方法上添加 `@Idempotent` 注解，当该方法方法上重复提交时进行拦截。原理是通过创建一个`AOP`切面，在切面中拦截添加 `@Idempotent` 注解的方法，同时获取当前请求的请求头中的 `IdempotentToken` 数据，通过`redis`的`setIfAbsent`命令判断是否已经存在，存的的话抛出异常

​	实现幂等控制需要前端进行配置，前端在发送请求时，在请求头里放入 `IdempotentToken`(幂等令牌) 数据，通常在是在前端页面生命周期中创建页面时生成一个`Token`，放入到这个请求头中，重复发送请求时会被后端拦截该请求，并返回错误提示.推荐在`Controller`中的方法上使用。

### 使用

```java
@Slf4j
@Tag(name ="测试控制器")
@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class TestController {

    // 添加幂等拦截注解
    @Idempotent
    @Operation(summary = "测试")
    @GetMapping("/hello")
    public ResResult<String> hello(){
        return Res.ok("hello");
    }
}
```
