package cn.bootx.sales.core.check.rule.func;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.convert.OrderConvert;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;

/**
* 策略使用检查接口
* @author xxm  
* @date 2020/12/6 
*/
public interface ActivityCheckRule extends AbstractCheckRule {

    /**
     * 计算时检查
     */
    default CheckRuleResult check(CheckRuleConfig checkRule, Activity activity, OrderDetailCache detail, OrderCache orderCache, CalculateCache calculateCache) {
        return check(checkRule,activity, OrderConvert.INSTANCE.convert(detail), OrderConvert.INSTANCE.convert(orderCache));
    }

    /**
     * 选择是检查
     */
    CheckRuleResult check(CheckRuleConfig checkRule, Activity activity, OrderDetailCheckParam detail, OrderCheckParam orderParam);

}
