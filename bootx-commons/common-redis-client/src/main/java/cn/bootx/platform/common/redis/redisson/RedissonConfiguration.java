package cn.bootx.platform.common.redis.redisson;

import cn.hutool.core.collection.CollUtil;
import lombok.AllArgsConstructor;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.ClusterServersConfig;
import org.redisson.config.Config;
import org.redisson.config.SingleServerConfig;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

/**
 * Redisson 自动配置
 *
 * @author xxm
 * @since 2022/12/19
 */
@Configuration
@ConditionalOnClass(name = "org.redisson.Redisson")
@AutoConfigureAfter(RedisAutoConfiguration.class)
@AllArgsConstructor
public class RedissonConfiguration {

    /**
     * 配置一个临时的对象到spring容器中，不使用
     * @return 一个RedissonClient的实现
     */
    @Bean
    public RedissonClient redissonClient() {
        return new RedissonClientTemporary();

    }

}
