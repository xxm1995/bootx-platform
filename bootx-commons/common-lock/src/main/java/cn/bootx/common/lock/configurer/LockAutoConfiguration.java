package cn.bootx.common.lock.configurer;

import cn.bootx.common.lock.handler.LockAspectHandler;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.ClusterServersConfig;
import org.redisson.config.Config;
import org.redisson.config.SingleServerConfig;
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
    private final RedisProperties redisProperties;
    private final String REDIS_PREFIX = "redis://";

    @Bean
    @ConditionalOnMissingBean
    public RedissonClient redisson() {
        // 单机/集群
        Config config = new Config();
        RedisProperties.Cluster cluster = redisProperties.getCluster();
        if (cluster == null || CollUtil.isEmpty(cluster.getNodes())) {
            initSingleConfig(config.useSingleServer());
        } else {
            initClusterConfig(config.useClusterServers());
        }

        return Redisson.create(config);
    }

    /**
     * 单节点模式
     */
    private void initSingleConfig(SingleServerConfig singleServerConfig){
        singleServerConfig.setAddress(REDIS_PREFIX+redisProperties.getHost()+":"+redisProperties.getPort())
                .setDatabase(redisProperties.getDatabase())
                .setPassword(redisProperties.getPassword());
    }

    /**
     * 集群模式
     */
    private void initClusterConfig(ClusterServersConfig clusterServersConfig){
        String[] nodes = redisProperties.getCluster().getNodes().stream()
                .map(node -> REDIS_PREFIX + node)
                .toArray(String[]::new);
        clusterServersConfig.setPassword(redisProperties.getPassword())
                .addNodeAddress(nodes);
    }
}
