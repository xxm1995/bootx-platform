package cn.bootx.common.spring.executor;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.annotation.EnableAsync;

import java.lang.reflect.Method;
import java.util.concurrent.Executor;

/**   
* 线程池配置, 整合TTl
* @author xxm  
* @date 2021/6/11 
*/
@Slf4j
@EnableAsync
@Configuration
@RequiredArgsConstructor
public class AsyncExecutorConfiguration implements AsyncConfigurer {
    private final Executor asyncExecutor;
    @Override
    public Executor getAsyncExecutor() {
        return asyncExecutor;
    }

    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {
        return new SpringAsyncExceptionHandler();
    }

    private static class SpringAsyncExceptionHandler implements AsyncUncaughtExceptionHandler {

        @Override
        public void handleUncaughtException(Throwable throwable, Method method, Object... objects) {
            log.error("异步方法中发生异常：" + throwable.getMessage(), throwable);
        }
    }
}
