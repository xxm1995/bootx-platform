package cn.bootx.sales.core.recommend;

import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.code.CouponStatusCode;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.handler.coupon.CouponCheckHandler;
import cn.bootx.sales.core.check.injector.CheckRuleInjector;
import cn.bootx.sales.core.check.rule.CheckRuleHandlerAdapter;
import cn.bootx.sales.core.coupon.dao.CouponManager;
import cn.bootx.sales.core.coupon.dao.CouponTemplateManager;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.match.injector.MatchRuleInjector;
import cn.bootx.sales.core.match.service.MatchRuleService;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.bootx.sales.dto.coupon.CouponDto;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 优惠券匹配
 * @author xxm
 * @date 2020/12/3
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderFindCouponService {

    private final CheckRuleHandlerAdapter checkRuleHandlerAdapter;
    private final CheckRuleInjector checkRuleInjector;
    private final MatchRuleInjector matchRuleInjector;
    private final CouponCheckHandler couponCheckHandler;

    private final CouponManager couponManager;
    private final CouponTemplateManager couponTemplateManager;
    private final MatchRuleService matchRuleService;


    /**
     * 获取订单可用的优惠券
     */
    public List<CouponDto> findCoupon(OrderCheckParam orderParam){
        // 获取到用户可用的优惠券
        Long userId = orderParam.getUserId();
        List<Coupon> coupons = couponManager.findByUserAndStatus(userId, CouponStatusCode.STATUS_NORMAL)
                .stream()
                .filter(couponCheckHandler::canUseCoupon)
                .collect(Collectors.toList());

        // 获取对应的模板
        List<Long> couponTemplateIds = coupons.stream()
                .map(Coupon::getTemplateId)
                .distinct()
                .collect(Collectors.toList());
        List<CouponTemplate> couponTemplates = couponTemplateManager.findAllByIds(couponTemplateIds);
        // 注入匹配规则
        matchRuleInjector.injectionTemplate(couponTemplates);

        // 初步筛选出可用的优惠卷策略
        List<CouponTemplate> templates = couponTemplates.stream()
                // 匹配订单适用的优惠券模板
                .filter(template -> matchRuleService.orderMatch(orderParam,template.getMatchRules()))
                .collect(Collectors.toList());

        // 根据初步筛选结果进行下一步的规则检查
        List<Long> templateIds = this.checkByRule(templates,orderParam);

        List<CouponDto> collect = coupons.stream()
                .map(Coupon::toDto)
                .collect(Collectors.toList());
        collect.stream()
                .filter(coupon -> !templateIds.contains(coupon.getTemplateId()))
                // 标示出来不可用
                .forEach(couponDto -> couponDto.setCanUse(3));
        return collect;
    }

    /**
     * 根据已配置规则进行下一步的筛选
     */
    public List<Long> checkByRule(List<CouponTemplate> templates, OrderCheckParam orderParam) {
        // 填充检查规则
        checkRuleInjector.injectionTemplate(templates, CheckRuleCode.RULE_TYPE_COUPON_CHECK);
        List<Long> templateIds = new ArrayList<>();

        /* 根据配置规则进行检查 */
        for (CouponTemplate template : templates) {
            List<CheckRuleConfig> selectCheckRule = template.getCheckRules();

            // 无检查配置默认添加到列表
            if (CollUtil.isEmpty(selectCheckRule)){
                templateIds.add(template.getId());
            }
            // 遍历的配置规则集, 选择出通过检查的
            if (this.checkByRule(template,orderParam)){
                templateIds.add(template.getId());
            }
        }
        return templateIds;
    }

    /**
     * 根据已配置规则进行判断是否通过
     */
    public boolean checkByRule(CouponTemplate template, OrderCheckParam orderParam){
        List<CheckRuleConfig> checkRules = template.getCheckRules();
        if (CollUtil.isEmpty(checkRules)){
            return true;
        }
        for (CheckRuleConfig checkRule : checkRules) {
            CheckRuleResult checkRuleResult = checkRuleHandlerAdapter.couponSelectCheck(template, checkRule, orderParam);
            if (!checkRuleResult.isPass()){
                return false;
            }
        }
        return true;
    }
}