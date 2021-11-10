package cn.bootx.starter.auth.config;

import cn.bootx.satoken.plugin.redis.SaTokenRedisConfiguration;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.jsontype.impl.LaissezFaireSubTypeValidator;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;

/**
* 配置
* @author xxm
* @date 2021/7/30
*/
@Configuration
@RequiredArgsConstructor
public class MySaTokenDaoRedisConfiguration extends SaTokenRedisConfiguration {

    private final ObjectMapper objectMapper;

    @Override
    protected ObjectMapper objectMapper() {
        ObjectMapper copy = objectMapper.copy();
        copy.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        copy.activateDefaultTyping(LaissezFaireSubTypeValidator.instance,ObjectMapper.DefaultTyping.NON_FINAL, JsonTypeInfo.As.WRAPPER_ARRAY);
        return copy;
    }
}
