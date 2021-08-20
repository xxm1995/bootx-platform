package cn.bootx.common.spring;

import cn.hutool.extra.spring.EnableSpringUtil;
import com.alibaba.ttl.threadpool.TtlExecutors;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;

/**
 * spring配置
 * @author xxm
 * @date 2021/6/11
 */
@Configuration
@EnableConfigurationProperties({SpringProperties.class})
@ConditionalOnClass(ApplicationContext.class)
@EnableSpringUtil
@RequiredArgsConstructor
public class SpringAutoConfiguration {

    private final SpringProperties springProperties;

    /**
     * 原始线程池
     */
    @Bean
    public ThreadPoolTaskExecutor springRawExecutor() {
        SpringProperties.Executor executor = springProperties.getExecutor();
        ThreadPoolTaskExecutor taskExecutor = new ThreadPoolTaskExecutor();
        taskExecutor.setCorePoolSize(executor.getCorePoolSize());
        taskExecutor.setMaxPoolSize(executor.getMaxPoolSize());
        taskExecutor.setQueueCapacity(executor.getQueueCapacity());
        taskExecutor.setKeepAliveSeconds(executor.getKeepAliveSeconds());
        taskExecutor.initialize();
        return taskExecutor;
    }

    /**
     * TTl包装后的线程执行器
     */
    @Bean
    @Primary
    public Executor asyncExecutor(ThreadPoolTaskExecutor springRawExecutor) {
        return TtlExecutors.getTtlExecutor(springRawExecutor);
    }

    /**
     * TTl包装后的线程执行服务
     */
    @Bean
    public ExecutorService asyncExecutorService(ThreadPoolTaskExecutor springRawExecutor){
        return TtlExecutors.getTtlExecutorService(springRawExecutor.getThreadPoolExecutor());
    }
}
