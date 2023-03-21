package cn.bootx.common.sequence.util;

import cn.bootx.common.core.exception.FatalException;
import cn.bootx.common.sequence.func.Sequence;
import cn.bootx.common.sequence.impl.DefaultRangeSequence;
import cn.bootx.common.sequence.range.SeqRangeConfig;
import cn.bootx.common.sequence.range.SeqRangeManager;
import cn.hutool.extra.spring.SpringUtil;
import lombok.experimental.UtilityClass;

import java.util.Objects;

/**
 * 序列号生成工具类
 *
 * @author xxm
 * @date 2022/12/27
 */
@UtilityClass
public class SequenceUtil {

    /**
     * 创建一个序列号生成器
     */
    public Sequence create(int step, int rangeStep, int rangeStart) {
        SeqRangeManager rangeManager = SpringUtil.getBean(SeqRangeManager.class);
        if (Objects.isNull(rangeManager)) {
            throw new FatalException("序列号生成器创建失败，缺少区间管理器");
        }
        SeqRangeConfig seqRangeConfig = new SeqRangeConfig().setStep(step)
            .setRangeStart(rangeStep)
            .setRangeStep(rangeStart);
        return new DefaultRangeSequence(rangeManager, seqRangeConfig);
    }

}
