package cn.bootx.common.lock.configurer;

import cn.bootx.common.lock.configurer.LockConfigProperties.SingleConfig;
import cn.bootx.common.lock.constant.LockConstant;
import cn.bootx.common.lock.handler.LockAspectHandler;
import lombok.RequiredArgsConstructor;
import org.apache.commons.lang3.StringUtils;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.redisson.config.SingleServerConfig;
import org.redisson.config.SslProvider;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.data.redis.RedisAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import java.net.MalformedURLException;
import java.net.URL;

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

    private final LockConfigProperties lockConfig;

    @Bean(name = "lockRedissonClient", destroyMethod = "shutdown")
    @ConditionalOnMissingBean
    public RedissonClient redisson() {
        SingleConfig singleServer = lockConfig.getSingleServer();
        Config config = new Config();
        config.useSingleServer()
                .setAddress("redis://"+singleServer.getAddress()+":"+singleServer.getPort())
                .setDatabase(singleServer.getDatabase())
                .setPassword(singleServer.getPassword());
        return Redisson.create(config);
    }


    /**
     * 初始化单机模式参数
     *
     * @param singleServerConfig 单机模式配置
     * @param singleConfig
     */
    private void initSingleConfig(SingleServerConfig singleServerConfig, SingleConfig singleConfig) throws MalformedURLException {
        singleServerConfig.setAddress(String.format("%s%s%s%s", lockConfig.isSslEnableEndpointIdentification() ? LockConstant.REDIS_SSL_URL_PREFIX : LockConstant.REDIS_URL_PREFIX,
                singleConfig.getAddress(), LockConstant.COLON, singleConfig.getPort()));
        singleServerConfig.setClientName(lockConfig.getClientName());
        singleServerConfig.setConnectionMinimumIdleSize(singleConfig.getConnMinIdleSize());
        singleServerConfig.setConnectionPoolSize(singleConfig.getConnPoolSize());
        singleServerConfig.setConnectTimeout(singleConfig.getConnTimeout());
        singleServerConfig.setDatabase(singleConfig.getDatabase());
        singleServerConfig.setDnsMonitoringInterval(singleConfig.getDnsMonitoringInterval());
        singleServerConfig.setIdleConnectionTimeout(singleConfig.getIdleConnTimeout());
        singleServerConfig.setKeepAlive(singleConfig.isKeepAlive());
        if (StringUtils.isNotBlank(singleConfig.getPassword())) {
            singleServerConfig.setPassword(singleConfig.getPassword());
        }
        singleServerConfig.setRetryAttempts(singleConfig.getRetryAttempts());
        singleServerConfig.setRetryInterval(singleConfig.getRetryInterval());
        singleServerConfig.setSslEnableEndpointIdentification(lockConfig.isSslEnableEndpointIdentification());
        if (lockConfig.getSslKeystore() != null) {
            singleServerConfig.setSslKeystore(new URL(lockConfig.getSslKeystore()));
        }
        if (lockConfig.getSslKeystorePassword() != null) {
            singleServerConfig.setSslKeystorePassword(lockConfig.getSslKeystorePassword());
        }
        singleServerConfig
                .setSslProvider(LockConstant.JDK.equalsIgnoreCase(lockConfig.getSslProvider()) ? SslProvider.JDK
                        : SslProvider.OPENSSL);
    }

}
