package cn.bootx.sales.core.check.rule;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.rule.func.*;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.param.coupon.ObtainCouponParam;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

/**
 * 调用检查规则适配器
 * @author xxm
 * @date 2020/12/13
 */
@Component
@RequiredArgsConstructor
public class CheckRuleHandlerAdapter {
    private final CheckRuleHandlerFactory checkRuleHandlerFactory;

    /**
     * 优惠券使用检查
     *  @param template      优惠券
     * @param checkRule      规则
     * @param orderCache     订单
     * @param calculateCache 缓存
     */
    public CheckRuleResult couponUseCheck(CouponTemplate template, CheckRuleConfig checkRule, OrderCache orderCache, CalculateCache calculateCache) {
        CouponCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), CouponCheckRule.class);
        return rule.check(checkRule,template, orderCache, calculateCache);
    }

    /**
     * 优惠券选择检查
     */
    public CheckRuleResult couponSelectCheck(CouponTemplate template, CheckRuleConfig checkRule, OrderCheckParam orderParam) {
        CouponCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), CouponCheckRule.class);
        return rule.check(checkRule,template, orderParam);
    }

    /**
     * 优惠券领取检查
     */
    public CheckRuleResult couponObtainCheck(CheckRuleConfig checkRule, CouponTemplate template, ObtainCouponParam param) {
        CouponObtainRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), CouponObtainRule.class);
        return rule.check(checkRule,template, param);
    }

    /**
     * 活动使用检查
     */
    public CheckRuleResult activityUseCheck(CheckRuleConfig checkRule, Activity activity, OrderDetailCache detail, OrderCache orderDto, CalculateCache calculateCache) {
        ActivityCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), ActivityCheckRule.class);
        return rule.check(checkRule,activity,detail,orderDto,calculateCache);
    }

    /**
     * 活动选择检查
     */
    public CheckRuleResult activitySelectCheck(CheckRuleConfig checkRule, Activity activity, OrderDetailCheckParam detail, OrderCheckParam orderParam){
        ActivityCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), ActivityCheckRule.class);
        return rule.check(checkRule,activity,detail,orderParam);
    }
}
