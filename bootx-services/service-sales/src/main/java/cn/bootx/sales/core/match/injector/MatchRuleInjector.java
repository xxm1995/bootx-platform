package cn.bootx.sales.core.match.injector;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.match.dao.MatchRuleManager;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 匹配关联关系注入器
 * @author xxm
 * @date 2020/12/3
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class MatchRuleInjector {
    private final MatchRuleManager checkMatchManager;

    /**
     * 注入活动匹配关系
     */
    public void injectionActivity(List<Activity> activities) {
        List<Long> strategyRegisterIds = activities.stream().map(Activity::getStrategyRegisterId).collect(Collectors.toList());
        // 匹配检查分组
        Map<Long, List<MatchRuleConfig>> checkMatchMapByActivity = checkMatchManager.findByStrategyRegisterIds(strategyRegisterIds).stream()
                .collect(Collectors.groupingBy(MatchRuleConfig::getStrategyRegisterId));
        activities.forEach(activity ->
                activity.setMatchRules(checkMatchMapByActivity.get(activity.getStrategyRegisterId()))
        );
    }

    /**
     * 注入优惠模板的匹配关系
     */
    public void injectionTemplate(List<CouponTemplate> couponTemplates) {
        List<Long> templateIds = couponTemplates.stream().map(CouponTemplate::getStrategyRegisterId).collect(Collectors.toList());
        // 匹配检查分组
        Map<Long, List<MatchRuleConfig>> checkMatchMapByTemplate = checkMatchManager.findByStrategyRegisterIds(templateIds).stream()
                .collect(Collectors.groupingBy(MatchRuleConfig::getStrategyRegisterId));
        couponTemplates.forEach(couponTemplate ->
                couponTemplate.setMatchRules(checkMatchMapByTemplate.get(couponTemplate.getStrategyRegisterId()))
        );
    }
}
