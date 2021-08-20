package cn.bootx.sales.core.strategy.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

@Slf4j
@Repository
@RequiredArgsConstructor
public class StrategyConfigValueManager extends BaseManager<StrategyConfigValueMapper,StrategyConfigValue> {

    /**
     * 根据注册ids获取配置参数
     */
    public List<StrategyConfigValue> findAllStrategyRegisterIds(List<Long> ids) {
        return findAllByFields(StrategyConfigValue::getStrategyRegisterId,ids);
    }

    public void deleteByStrategyRegisterId(Long id) {
        deleteByField(StrategyConfigValue::getStrategyRegisterId,id);
    }

    public void deleteByStrategyId(Long strategyId) {
        deleteByField(StrategyConfigValue::getStrategyId,strategyId);

    }
}
