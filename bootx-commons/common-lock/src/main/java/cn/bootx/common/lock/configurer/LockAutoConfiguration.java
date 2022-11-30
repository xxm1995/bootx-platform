package cn.bootx.common.lock.configurer;

import cn.bootx.common.lock.handler.LockAspectHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
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

}
