package cn.bootx.common.redis;

import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettucePoolingClientConfiguration;
import org.springframework.data.redis.core.StringRedisTemplate;

/**
* @author xxm
* @date 2020/4/9 15:40
*/
@Configuration
@ConditionalOnClass(StringRedisTemplate.class)
public class RedisClientAutoConfiguration {

    /**
     * 默认 RedisClient
     */
	@Bean
    @Primary
	public RedisClient redisClient(StringRedisTemplate stringRedisTemplate) {
		return new RedisClient(stringRedisTemplate);
	}

    /**
     * 配置lettuce连接池
     */
    @Bean
    @ConfigurationProperties(prefix = "spring.redis.lettuce.pool")
    public GenericObjectPoolConfig<LettucePoolingClientConfiguration> redisPool() {
        return new GenericObjectPoolConfig<>();
    }

    /**
     * 默认redis配置
     */
    @Bean
    @Primary
    public RedisStandaloneConfiguration redisStandaloneConfiguration(RedisProperties redisProperties){
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setHostName(redisProperties.getHost());
        redisStandaloneConfiguration.setDatabase(redisProperties.getDatabase());
        redisStandaloneConfiguration.setPort(redisProperties.getPort());
        redisStandaloneConfiguration.setPassword(redisProperties.getPassword());
        return redisStandaloneConfiguration;
    }

    @Bean
    @Primary
    public LettuceConnectionFactory factory(GenericObjectPoolConfig<LettucePoolingClientConfiguration> config,
                                            RedisStandaloneConfiguration redisStandaloneConfiguration ) {
        LettuceClientConfiguration clientConfiguration = LettucePoolingClientConfiguration
                .builder()
                .poolConfig(config)
                .build();
        return new LettuceConnectionFactory(redisStandaloneConfiguration, clientConfiguration);
    }

}
