package cn.bootx.common.sequence.range.jdbc;

import cn.bootx.common.sequence.configuration.SequenceProperties;
import cn.bootx.common.sequence.exception.SeqException;
import cn.bootx.common.sequence.range.SeqRange;
import cn.bootx.common.sequence.range.SeqRangeManager;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**
 * 区间管理器jdbc数据库方式实现
 * @author xxm
 * @date 2021/12/14
 */
@Getter
@Setter
@RequiredArgsConstructor
public class JdbcSeqRangeManager implements SeqRangeManager {
    private final JdbcRangeHandler jdbcRangeHandler;
    private final SequenceProperties sequenceProperties;

    /**
     * 标记业务key是否存在，如果false，在取nextRange时，会取check一把
     * 这个boolean只为提高性能，不用每次都取redis check
     */
    private volatile boolean keyAlreadyExist;

    /**
     * 获取指定区间名的下一个区间
     *
     * @param name 区间名
     * @return 返回区间
     * @throws SeqException 异常
     */
    @Override
    public SeqRange nextRange(String name) throws SeqException {
        if (!keyAlreadyExist) {
            //第一次不存在，进行初始化,不存在就set，存在就忽略
            jdbcRangeHandler.setIfAbsentRange(name, sequenceProperties.getRangeStart());
            keyAlreadyExist = true;
        }
        int step = sequenceProperties.getRangeStep();
        Long max = jdbcRangeHandler.incrementRange(name, step);
        long min = max - step + sequenceProperties.getStep();
        return new SeqRange(min, max);
    }
}
