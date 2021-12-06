package cn.bootx.common.redis;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import lombok.RequiredArgsConstructor;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.redis.connection.RedisConfiguration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceClientConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;
import org.springframework.data.redis.connection.lettuce.LettucePoolingClientConfiguration;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.GenericJackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
* @author xxm
* @date 2020/4/9 15:40
*/
@Configuration
@ConditionalOnClass(StringRedisTemplate.class)
@RequiredArgsConstructor
public class RedisClientAutoConfiguration {
    private final ObjectMapper objectMapper;

    /**
     * 默认 RedisClient
     */
	@Bean
    @Primary
	public RedisClient redisClient(StringRedisTemplate stringRedisTemplate) {
		return new RedisClient(stringRedisTemplate);
	}

    /**
     * 默认 RedisTemplate
     */
    @Bean
    @Primary
    public RedisTemplate<String,?> redisTemplate(RedisConnectionFactory redisConnectionFactory){

        // 对象映射器
        ObjectMapper copy = objectMapper.copy();
        // 序列化是记录被序列化的类型信息
        copy.activateDefaultTyping(LaissezFaireSubTypeValidator.instance,ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.WRAPPER_ARRAY);

        // 配置key和value的序列化方式
        StringRedisSerializer keySerializer = new StringRedisSerializer();
        RedisSerializer<Object> valueSerializer = new GenericJackson2JsonRedisSerializer(copy);

        // 构建RedisTemplate
        RedisTemplate<String, ?> template = new RedisTemplate<>();
        template.setConnectionFactory(redisConnectionFactory);
        template.setKeySerializer(keySerializer);
        template.setHashKeySerializer(keySerializer);
        template.setValueSerializer(valueSerializer);
        template.setHashValueSerializer(valueSerializer);
        template.afterPropertiesSet();
        return template;

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
     * 默认redis配置(单机配置)
     * 后期需要支持集群配置
     */
    @Bean
    @Primary
    public RedisConfiguration redisStandaloneConfiguration(RedisProperties redisProperties){
        // 单机模式
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration();
        redisStandaloneConfiguration.setHostName(redisProperties.getHost());
        redisStandaloneConfiguration.setDatabase(redisProperties.getDatabase());
        redisStandaloneConfiguration.setPort(redisProperties.getPort());
        redisStandaloneConfiguration.setPassword(redisProperties.getPassword());
        return redisStandaloneConfiguration;
    }


    /**
     * 连接工厂
     */
    @Bean
    @Primary
    public LettuceConnectionFactory factory(GenericObjectPoolConfig<LettucePoolingClientConfiguration> config,
                                            RedisConfiguration redisConfiguration ) {
        LettuceClientConfiguration clientConfiguration = LettucePoolingClientConfiguration
                .builder()
                .poolConfig(config)
                .build();
        return new LettuceConnectionFactory(redisConfiguration, clientConfiguration);
    }

}
