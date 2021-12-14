package cn.bootx.common.sequence.configuration;

import cn.bootx.common.redis.RedisClient;
import cn.bootx.common.sequence.exception.SeqException;
import cn.bootx.common.sequence.func.Sequence;
import cn.bootx.common.sequence.impl.DefaultRangeSequence;
import cn.bootx.common.sequence.range.SeqRangeManager;
import cn.bootx.common.sequence.range.jdbc.JdbcRangeHandler;
import cn.bootx.common.sequence.range.jdbc.JdbcSeqRangeManager;
import cn.bootx.common.sequence.range.redis.RedisSeqRangeManager;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 序列化生成器
 * @author xxm
 * @date 2021/8/6
 */
@Configuration
@RequiredArgsConstructor
@EnableConfigurationProperties(SequenceProperties.class)
public class SequenceAutoConfiguration {
    private final SequenceProperties sequenceProperties;

    /**
     * 区间管理器
     * @param redisClient
     */
    @Bean
    @ConditionalOnMissingBean(SeqRangeManager.class)
    public SeqRangeManager redisSeqSequence(RedisClient redisClient, JdbcRangeHandler jdbcRangeHandler){
        if (sequenceProperties.getType() == SequenceProperties.Type.REDIS){
            return new RedisSeqRangeManager(redisClient,sequenceProperties);
        } else if (sequenceProperties.getType() == SequenceProperties.Type.JDBC) {
            return new JdbcSeqRangeManager(jdbcRangeHandler, sequenceProperties);
        } else {
            throw new SeqException("区间管理器的实现不存在");
        }
    }

    @Bean
    @ConditionalOnMissingBean(Sequence.class)
    public Sequence sequence(SeqRangeManager seqRangeManager){
        return new DefaultRangeSequence(seqRangeManager);
    }

}
