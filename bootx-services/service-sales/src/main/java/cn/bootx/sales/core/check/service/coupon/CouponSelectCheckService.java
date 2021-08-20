package cn.bootx.sales.core.check.service.coupon;

import cn.bootx.sales.core.check.injector.CheckRuleInjector;
import cn.bootx.sales.core.check.rule.CheckRuleHandlerAdapter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
* 优惠券匹配检查
* @author xxm
* @date 2021/5/14
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class CouponSelectCheckService {
    private final CheckRuleHandlerAdapter checkRuleHandlerAdapter;
    private final CheckRuleInjector checkRuleInjector;


}
