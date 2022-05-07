package cn.bootx.common.lock.configurer;

import cn.bootx.common.lock.handler.LockAspectHandler;
import lombok.RequiredArgsConstructor;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * Lock自动装配配置
 *
 * @author xianzhi.chen@hand-china.com 2019年1月14日下午5:08:51
 */
@Configuration
@AutoConfigureAfter(RedisAutoConfiguration.class)
@Import({LockAspectHandler.class})
@RequiredArgsConstructor
public class LockAutoConfiguration {

    @Bean(name = "lockRedissonClient", destroyMethod = "shutdown")
    @ConditionalOnMissingBean
    public RedissonClient redisson(RedisProperties redisProperties) {
        Config config = new Config();
        config.useSingleServer()
                .setAddress("redis://"+redisProperties.getHost()+":"+redisProperties.getPort())
                .setDatabase(redisProperties.getDatabase())
                .setPassword(redisProperties.getPassword());
        return Redisson.create(config);
    }
}
