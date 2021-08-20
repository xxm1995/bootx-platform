package cn.bootx.sales.core.strategy.dao;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.strategy.entity.Strategy;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
* 策略
* @author xxm
* @date 2020/10/11
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class StrategyManager extends BaseManager<StrategyMapper,Strategy> {


    public boolean existsByCode(String code){
        return existedByField(Strategy::getCode,code);
    }

    public boolean existsByCode(String code,Long id){
        return lambdaQuery().eq(Strategy::getCode,code)
                .ne(Strategy::getId,id)
                .exists();
    }

    public boolean existsById(Long id) {
        return existedByField(MpBaseEntity::getId,id);
    }

    public int countByStrategyId(Long id) {
        return countByField(MpBaseEntity::getId,id);
    }
}
