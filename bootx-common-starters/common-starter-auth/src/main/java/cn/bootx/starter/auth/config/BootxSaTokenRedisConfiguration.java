package cn.bootx.starter.auth.config;

import cn.bootx.starter.auth.redis.SaTokenRedisConfiguration;
import cn.bootx.starter.auth.redis.SaTokenRedisProperties;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;

/**
* 配置
* @author xxm
* @date 2021/7/30
*/
@Configuration
public class BootxSaTokenRedisConfiguration extends SaTokenRedisConfiguration {

    private final ObjectMapper objectMapper;

    public BootxSaTokenRedisConfiguration(SaTokenRedisProperties saTokenDaoRedisProperties, RedisConnectionFactory connectionFactory, ObjectMapper objectMapper) {
        super(saTokenDaoRedisProperties, connectionFactory);
        this.objectMapper = objectMapper;
    }

    @Override
    protected ObjectMapper objectMapper() {
        ObjectMapper copy = objectMapper.copy();
        copy.activateDefaultTyping(LaissezFaireSubTypeValidator.instance,ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.WRAPPER_ARRAY);
        return copy;
    }
}
