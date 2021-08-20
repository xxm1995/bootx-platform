package cn.bootx.sales.core.check.rule.impl.coupon.select;

import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.rule.func.CouponCheckRule;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.param.order.OrderCheckParam;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**   
* 优惠券叠加检查
* @author xxm  
* @date 2020/12/6 
*/
@Component
public class CheckMultipleRuleImpl implements CouponCheckRule {
    @Override
    public String getCode() {
        return CheckRuleCode.Coupon.CHECK_USE_MULTIPLE;
    }

    @Override
    public CheckRuleResult check(CheckRuleConfig checkRule,CouponTemplate template, OrderCache orderCache, CalculateCache calculateCache) {
        List<Coupon> coupons = orderCache.getCoupons();
        // 根据模板ID分组
        Map<Long, List<Coupon>> couponsByTemplate = coupons.stream()
                .collect(Collectors.groupingBy(Coupon::getTemplateId));
        List<Coupon> list = couponsByTemplate.get(template.getId());
        CheckRuleResult checkRuleResult = new CheckRuleResult()
                .setPass(list.size()>1);
        if (list.size()>1){
            checkRuleResult.setMsg("优惠券不允许叠加使用");
        }
        return checkRuleResult;
    }

    @Override
    public CheckRuleResult check(CheckRuleConfig checkRule, CouponTemplate template, OrderCheckParam orderCheckParam) {
        return new CheckRuleResult();
    }

}
