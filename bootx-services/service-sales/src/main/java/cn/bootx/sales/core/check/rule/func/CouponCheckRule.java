package cn.bootx.sales.core.check.rule.func;

import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.convert.OrderConvert;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.param.order.OrderCheckParam;

/**
* 优惠券使用检查接口
* @author xxm  
* @date 2020/12/6 
*/
public interface CouponCheckRule extends AbstractCheckRule {

    /**
     * 计算时检查
     */
    default CheckRuleResult check(CheckRuleConfig checkRule, CouponTemplate template, OrderCache orderCache, CalculateCache calculateCache) {
        return check(checkRule,template, OrderConvert.INSTANCE.convert(orderCache));
    }

    /**
     * 选择时检查
     */
    CheckRuleResult check(CheckRuleConfig checkRule, CouponTemplate template, OrderCheckParam orderCheckParam);
}
