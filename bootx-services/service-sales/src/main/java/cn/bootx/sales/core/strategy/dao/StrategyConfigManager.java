package cn.bootx.sales.core.strategy.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.strategy.entity.StrategyConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@RequiredArgsConstructor
public class StrategyConfigManager extends BaseManager<StrategyConfigMapper,StrategyConfig> {

    public List<StrategyConfig> findByStrategyId(Long strategyId){
        return findAllByField(StrategyConfig::getStrategyId,strategyId);
    }

    public void deleteByStrategyId(Long strategyId) {
        deleteByField(StrategyConfig::getStrategyId,strategyId);
    }

    public List<StrategyConfig> findByType(Integer type) {
        return findAllByField(StrategyConfig::getType,type);
    }
}
