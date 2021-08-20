package cn.bootx.common.sequence.range;

import cn.bootx.common.redis.RedisClient;
import cn.bootx.common.sequence.SequenceProperties;
import cn.bootx.common.sequence.exception.SeqException;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

/**   
* Redis区间管理器
* @author xxm  
* @date 2021/8/6 
*/
@Getter
@Setter
@RequiredArgsConstructor
public class RedisSeqRangeManager implements SeqRangeManager {

    private final RedisClient redisClient;
    private final SequenceProperties sequenceProperties;

    /**
     * 标记业务key是否存在，如果false，在取nextRange时，会取check一把
     * 这个boolean只为提高性能，不用每次都取redis check
     */
    private volatile boolean keyAlreadyExist;

    @Override
    public SeqRange nextRange(String name) throws SeqException {
        if (!keyAlreadyExist) {
            boolean exists = redisClient.exists(getRealKey(name));

            if (!exists) {
                //第一次不存在，进行初始化,不存在就set，存在就忽略
                redisClient.setIfAbsent(getRealKey(name), String.valueOf(sequenceProperties.getRangeStart()));
            }
            keyAlreadyExist = true;
        }
        int step = sequenceProperties.getRangeStep();
        Long max = redisClient.increment(getRealKey(name), step);
        long min = max - step + sequenceProperties.getStep();
        return new SeqRange(min, max);
    }

    /**
     * 获取key
     */
    private String getRealKey(String name) {
        return sequenceProperties.getKeyPrefix() + name;
    }
}
