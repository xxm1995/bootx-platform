package cn.bootx.common.sequence.configuration;

import cn.bootx.common.sequence.func.Sequence;
import cn.bootx.common.sequence.impl.DefaultRangeSequence;
import cn.bootx.common.sequence.range.SeqRangeConfig;
import cn.bootx.common.sequence.range.SeqRangeManager;
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

    @Bean
    @ConditionalOnMissingBean(Sequence.class)
    public Sequence sequence(SeqRangeManager seqRangeManager){
        SeqRangeConfig seqRangeConfig = new SeqRangeConfig()
                .setStep(sequenceProperties.getStep())
                .setRangeStart(sequenceProperties.getRangeStart())
                .setRangeStep(sequenceProperties.getRangeStep());
        return new DefaultRangeSequence(seqRangeManager, seqRangeConfig);
    }

}
