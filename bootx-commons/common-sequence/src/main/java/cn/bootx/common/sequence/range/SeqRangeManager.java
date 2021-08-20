package cn.bootx.common.sequence.range;


import cn.bootx.common.sequence.exception.SeqException;

/**
 * 区间管理器
 * @author xuan on 2018/1/10.
 */
public interface SeqRangeManager {

    /**
     * 获取指定区间名的下一个区间
     *
     * @param name 区间名
     * @return 返回区间
     * @throws SeqException 异常
     */
    SeqRange nextRange(String name) throws SeqException;
}
