package cn.bootx.sales.core.check.config.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class CheckRuleManager extends BaseManager<CheckRuleMapper,CheckRuleConfig> {

    /**
     * 优惠券规则
     * @see CheckRuleCode
     */
    public List<CheckRuleConfig> findByTemplates(List<Long> ids, int ruleType){
        return lambdaQuery().eq(CheckRuleConfig::getRuleType,CheckRuleCode.RULE_COUPON)
                .in(CheckRuleConfig::getStrategyRegisterId,ids)
                .list();
    }

    /**
     * 优惠券规则
     * @see CheckRuleCode
     */
    public List<CheckRuleConfig> findByRegisters(List<Long> ids, int ruleType){
        return lambdaQuery().eq(CheckRuleConfig::getRuleType,CheckRuleCode.RULE_ACTIVITY)
                .in(CheckRuleConfig::getStrategyRegisterId,ids)
                .list();
    }
}
