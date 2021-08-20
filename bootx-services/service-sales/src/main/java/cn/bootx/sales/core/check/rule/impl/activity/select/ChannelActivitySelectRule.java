package cn.bootx.sales.core.check.rule.impl.activity.select;

import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.rule.func.ActivityCheckRule;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

/**
* 渠道检查
* @author xxm
* @date 2021/5/18
*/
@Component
@RequiredArgsConstructor
public class ChannelActivitySelectRule implements ActivityCheckRule {

    @Override
    public String getCode() {
        return CheckRuleCode.Activity.CHECK_CHANNEL;
    }

    @Override
    public CheckRuleResult check(CheckRuleConfig checkRule, Activity activity, OrderDetailCheckParam detail, OrderCheckParam orderParam) {
        String addition = checkRule.getAddition();
        List<String> channelIds = StrUtil.split(addition, ',');
        boolean contains = channelIds.contains(String.valueOf(orderParam.getChannelId()));
        CheckRuleResult checkRuleResult = new CheckRuleResult()
                .setPass(contains);
        if (!contains){
            checkRuleResult.setMsg("渠道检查未通过");
        }
        return checkRuleResult;
    }
}
