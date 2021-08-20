package cn.bootx.sales.core.check.service.coupon;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.LocalDateTimeUtils;
import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.code.CouponStatusCode;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.handler.coupon.CouponCheckHandler;
import cn.bootx.sales.core.check.injector.CheckRuleInjector;
import cn.bootx.sales.core.check.rule.CheckRuleHandlerAdapter;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.match.service.MatchRuleService;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * 优惠券计算检查
 * @author xxm
 * @date 2020/11/26
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CouponCalculateCheckService {

    private final CheckRuleInjector checkRuleInjector;
    private final CouponCheckHandler couponCheckHandler;
    private final CheckRuleHandlerAdapter checkRuleHandlerAdapter;
    private final MatchRuleService matchRuleService;

    /**
     * 检查优惠券(公共)
     */
    public void checkCommons(OrderCache orderCache, CalculateCache calculateCache) {

        // 没有优惠券则不进行检查
        List<Coupon> coupons = orderCache.getCoupons();
        if (CollUtil.isEmpty(coupons)){
            return;
        }

        // 状态是否可用
        boolean statusFlag = coupons.stream()
                .anyMatch(coupon -> !Objects.equals(coupon.getStatus(), CouponStatusCode.STATUS_NORMAL));
        if (statusFlag){
            throw new BizException("状态不可用");
        }

        // 用户是否符合
        boolean userFlag = coupons.stream()
                .anyMatch(coupon -> !Objects.equals(orderCache.getUserId(), coupon.getUserId()));
        if (userFlag){
            throw new BizException("用户不合法");
        }

        // 是否在可用的时间段
        boolean dateTimeFlag = coupons.stream()
                .anyMatch(coupon -> !LocalDateTimeUtils.between(LocalDateTime.now(), coupon.getStartTime(), coupon.getEndTime()));
        if (dateTimeFlag){
            throw new BizException("优惠券时间不符合");
        }

        // 优惠券模板
        Map<Long, CouponTemplate> couponTemplateMap = calculateCache.getCouponTemplateMap();
        List<CouponTemplate> templates = coupons.stream()
                .map(coupon -> couponTemplateMap.get(coupon.getTemplateId()))
                .collect(Collectors.toList());

        // 互斥检查
        for (CouponTemplate template : templates) {
            if (!couponCheckHandler.activityMutual(template, orderCache)) {
                throw new BizException("优惠券与当前策略互斥");
            }
            if (!couponCheckHandler.couponMutual(template, orderCache)){
                throw new BizException("优惠券之间存在互斥");
            }
        }
        // 检查优惠券是否可以匹配到当前订单中
        for (CouponTemplate template : templates) {
            if (!matchRuleService.orderMatch(orderCache, template.getMatchRules())) {
                throw new BizException("优惠券不适用当前订单");
            }
        }
    }

    /**
     * 根据配置的规则进行检查
     */
    public void checkByRule(OrderCache orderDto, CalculateCache calculateCache){
        // 没有优惠券则不进行检查
        List<Coupon> coupons = orderDto.getCoupons();
        if (CollUtil.isEmpty(coupons)){
            return;
        }
        Map<Long, CouponTemplate> couponTemplateMap = calculateCache.getCouponTemplateMap();
        List<CouponTemplate> templates = coupons.stream()
                .map(coupon -> couponTemplateMap.get(coupon.getTemplateId()))
                .collect(Collectors.toList());

        checkRuleInjector.injectionTemplate(templates, CheckRuleCode.RULE_TYPE_ACTIVITY_CHECK);

        /* 根据配置规则进行检查 */
        for (CouponTemplate template : templates) {
            List<CheckRuleConfig> useCheckRules = template.getCheckRules();
            if (CollUtil.isEmpty(useCheckRules)){
                continue;
            }
            for (CheckRuleConfig checkRule : useCheckRules) {
                // 进行检查
                CheckRuleResult checkRuleResult = checkRuleHandlerAdapter.couponUseCheck(template, checkRule, orderDto, calculateCache);
                if (!checkRuleResult.isPass()){
                    throw new BizException(checkRuleResult.getMsg());
                }
            }
        }
    }

}
