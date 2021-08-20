package cn.bootx.sales.core.check.injector;

import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.check.config.dao.CheckRuleManager;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.strategy.dao.StrategyManager;
import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 优惠券使用规则检查注入器
 * @author xxm
 * @date 2020/12/5
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class CheckRuleInjector {
    private final CheckRuleManager checkRuleManager;
    private final StrategyManager strategyManager;

    /**
     * 注入计算规则数据
     * @see CheckRuleCode
     */
    public void injectionTemplate(List<CouponTemplate> couponTemplates,int checkType){
        List<Long> registerIds = couponTemplates.stream().map(CouponTemplate::getStrategyRegisterId).collect(Collectors.toList());
        List<CheckRuleConfig> checkRules = checkRuleManager.findByTemplates(registerIds,checkType);
        // 注入策略属性并返回分组
        Map<Long, List<CheckRuleConfig>> checkRuleMap = this.injectionAndGroupByStrategy(checkRules);
        if (Objects.isNull(checkRuleMap)){
            return;
        }
        for (CouponTemplate couponTemplate : couponTemplates) {
            couponTemplate.setCheckRules(checkRuleMap.get(couponTemplate.getStrategyRegisterId()));
        }
    }

    /**
     * 注入计算规则数据
     * @see CheckRuleCode
     */
    public void injectionActivity(List<Activity> activities, int checkType){
        List<Long> registerIds = activities.stream().map(Activity::getStrategyRegisterId).collect(Collectors.toList());
        List<CheckRuleConfig> checkRules = checkRuleManager.findByRegisters(registerIds,checkType);

        // 注入策略属性并返回分组
        Map<Long, List<CheckRuleConfig>> checkRuleMap = this.injectionAndGroupByStrategy(checkRules);
        if (Objects.isNull(checkRuleMap)){
            return;
        }
        for (Activity activity : activities) {
            activity.setCheckRules(checkRuleMap.get(activity.getStrategyRegisterId()));
        }
    }

    /**
     * 给检查规则添加相对应的策略属性, 并对检查规则根据策略注册id进行分组
     */
    private Map<Long, List<CheckRuleConfig>> injectionAndGroupByStrategy(List<CheckRuleConfig> checkRules){

        List<Long> strategyIds = checkRules.stream()
                .map(CheckRuleConfig::getStrategyId)
                .distinct()
                .collect(Collectors.toList());
        if (CollUtil.isEmpty(strategyIds)){
            return null;
        }

        // 注入策略属性
        Map<Long, Strategy> strategyMap = strategyManager.findAllByIds(strategyIds)
                .stream()
                .collect(Collectors.toMap(Strategy::getId, o->o));
        for (CheckRuleConfig checkRule : checkRules) {
            Strategy strategy = strategyMap.get(checkRule.getStrategyId());
            checkRule.setRuleScript(strategy.getRuleScript())
                    .setEngineType(strategy.getEngineType());
        }
        return checkRules.stream()
                .collect(Collectors.groupingBy(CheckRuleConfig::getStrategyRegisterId));
    }
}
