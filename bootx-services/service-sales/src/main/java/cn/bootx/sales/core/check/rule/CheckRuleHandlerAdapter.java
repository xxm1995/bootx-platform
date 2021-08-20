package cn.bootx.sales.core.check.rule;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.StrategyCode;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.rule.func.*;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.engine.groovy.GroovyHandler;
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
        int type = checkRule.getEngineType();
        switch (type) {
            case StrategyCode.ENGINE_SYSTEM: {
                CouponCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), CouponCheckRule.class);
                return rule.check(checkRule,template, orderCache, calculateCache);
            }
            case StrategyCode.ENGINE_JAVASCRIPT: {
                throw new BizException("暂不支持");
            }
            case StrategyCode.ENGINE_GROOVY: {
                GroovyHandler.CheckParam checkParam = new GroovyHandler.CheckParam()
                        .setTemplate(template)
                        .setOrderCache(orderCache)
                        .setCheckRule(checkRule)
                        .setCalculateCache(calculateCache);
               return GroovyHandler.checkByScript(checkRule,checkParam);
            }
            default:
                throw new BizException("不支持的引擎类型");
        }
    }

    /**
     * 优惠券选择检查
     */
    public CheckRuleResult couponSelectCheck(CouponTemplate template, CheckRuleConfig checkRule, OrderCheckParam orderParam) {
        int type = checkRule.getEngineType();
        switch (type) {
            case StrategyCode.ENGINE_SYSTEM: {
                CouponCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), CouponCheckRule.class);
                return rule.check(checkRule,template, orderParam);
            }
            case StrategyCode.ENGINE_JAVASCRIPT: {
                throw new BizException("暂不支持");
            }
            case StrategyCode.ENGINE_GROOVY: {
                GroovyHandler.CheckParam checkParam = new GroovyHandler.CheckParam()
                        .setTemplate(template)
                        .setCheckRule(checkRule)
                        .setOrderParam(orderParam);
                return GroovyHandler.checkByScript(checkRule,checkParam);
            }
            default:
                throw new BizException("不支持的引擎类型");
        }
    }

    /**
     * 优惠券领取检查
     */
    public CheckRuleResult couponObtainCheck(CheckRuleConfig checkRule, CouponTemplate template, ObtainCouponParam param) {
        int type = checkRule.getEngineType();
        switch (type) {
            case StrategyCode.ENGINE_SYSTEM: {
                CouponObtainRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), CouponObtainRule.class);
                return rule.check(checkRule,template, param);
            }
            case StrategyCode.ENGINE_JAVASCRIPT: {
                throw new BizException("暂不支持");
            }
            case StrategyCode.ENGINE_GROOVY: {
                GroovyHandler.CheckParam checkParam = new GroovyHandler.CheckParam()
                        .setTemplate(template)
                        .setCheckRule(checkRule)
                        .setObtainCouponParam(param);
               return GroovyHandler.checkByScript(checkRule,checkParam);
            }
            default:
                throw new BizException("不支持的引擎类型");
        }
    }

    /**
     * 活动使用检查
     */
    public CheckRuleResult activityUseCheck(CheckRuleConfig checkRule, Activity activity, OrderDetailCache detail, OrderCache orderDto, CalculateCache calculateCache) {
        int type = checkRule.getEngineType();
        switch (type) {
            case StrategyCode.ENGINE_SYSTEM: {
                ActivityCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), ActivityCheckRule.class);
                return rule.check(checkRule,activity,detail,orderDto,calculateCache);
            }
            case StrategyCode.ENGINE_JAVASCRIPT: {
                throw new BizException("暂不支持");
            }
            case StrategyCode.ENGINE_GROOVY: {
                GroovyHandler.CheckParam checkParam = new GroovyHandler.CheckParam()
                        .setCheckRule(checkRule)
                        .setActivity(activity)
                        .setOrderCache(orderDto)
                        .setOrderDetailCache(detail)
                        .setCalculateCache(calculateCache);
                return GroovyHandler.checkByScript(checkRule,checkParam);
            }
            default:
                throw new BizException("不支持的引擎类型");
        }
    }

    /**
     * 活动选择检查
     */
    public CheckRuleResult activitySelectCheck(CheckRuleConfig checkRule, Activity activity, OrderDetailCheckParam detail, OrderCheckParam orderParam){
        int type = checkRule.getEngineType();
        switch (type) {
            case StrategyCode.ENGINE_SYSTEM: {
                ActivityCheckRule rule = checkRuleHandlerFactory.getRuleHandler(checkRule.getCode(), ActivityCheckRule.class);
                return rule.check(checkRule,activity,detail,orderParam);
            }
            case StrategyCode.ENGINE_JAVASCRIPT: {
                throw new BizException("JAVASCRIPT暂不支持");
            }
            case StrategyCode.ENGINE_GROOVY: {
                GroovyHandler.CheckParam checkParam = new GroovyHandler.CheckParam()
                        .setCheckRule(checkRule)
                        .setActivity(activity)
                        .setOrderParam(orderParam)
                        .setOrderDetailParam(detail);
                return GroovyHandler.checkByScript(checkRule, checkParam);
            }
            default:
                throw new BizException("不支持的引擎类型");
        }
    }
}
