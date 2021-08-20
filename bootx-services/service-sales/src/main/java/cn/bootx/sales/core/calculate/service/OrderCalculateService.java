package cn.bootx.sales.core.calculate.service;

import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.service.activity.ActivityCalculateCheckService;
import cn.bootx.sales.core.check.service.coupon.CouponCalculateCheckService;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.match.service.MatchRuleService;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.order.OrderDetailPreviewResult;
import cn.bootx.sales.dto.order.OrderPreviewResult;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

/**
 * 订单价格计算服务供
 * @author xxm
 * @date 2020/11/1
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderCalculateService {

    private final CalculateService calculateService;
    private final MatchRuleService matchRuleService;

    private final CouponCalculateCheckService couponCalculateCheckService;
    private final ActivityCalculateCheckService activityCalculateCheckService;

    /**
     * 计算价格
     */
    public OrderPreviewResult calculateOrderPrice(OrderCache orderCache, CalculateCache calculateCache){

        // 活动公共检查
        activityCalculateCheckService.checkCommons(orderCache,calculateCache);
        // 活动按配置规则检查
        activityCalculateCheckService.checkByRule(orderCache,calculateCache);

        // 优惠券公共检查
        couponCalculateCheckService.checkCommons(orderCache,calculateCache);
        // 优惠券按配置规则检查
        couponCalculateCheckService.checkByRule(orderCache,calculateCache);

        // 计算价格
        return calculateOrderPriceNoCheck(orderCache,calculateCache);
    }

    /**
     * 计算订单价格, 不进行检查
     */
    public OrderPreviewResult calculateOrderPriceNoCheck(OrderCache orderCache, CalculateCache calculateCache){
        List<OrderDetailCache> details = orderCache.getDetails();
        // 策略计算
        this.calculateActivityPrice(orderCache,calculateCache);
        // 优惠券计算
        this.calculateCouponPrice(orderCache,calculateCache);
        // 计算出来明细条目具体的价格
        calculateService.calculateAmountByDetail(details);

        // 支付总价
        BigDecimal payAmount = details.stream()
                .map(OrderDetailCache::getPayAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
        // 原始总价
        BigDecimal totalAmount = details.stream()
                .map(OrderDetailCache::getTotalAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 构建预览对象
        List<OrderDetailPreviewResult> detailPreviews = details.stream()
                .map(OrderDetailCache::toPreview)
                .collect(Collectors.toList());
        OrderPreviewResult orderPreviewResult = new OrderPreviewResult();
        BeanUtil.copyProperties(orderCache,orderPreviewResult);
        orderPreviewResult.setOrderDetails(detailPreviews)
                .setTotalAmount(totalAmount)
                .setPayAmount(payAmount);
        return orderPreviewResult;
    }

    /**
     * 活动计算
     */
    private void calculateActivityPrice(OrderCache orderCache, CalculateCache calculateCache){
        List<OrderDetailCache> details = orderCache.getDetails();

        // 获取明细所有活动对应的策略注册id
        List<Long> strategyRegisterIds = details.stream()
                .map(OrderDetailCache::getStrategyRegisterIds)
                .filter(CollUtil::isNotEmpty)
                .flatMap(Collection::stream)
                .distinct()
                .collect(Collectors.toList());

        // 没有对应的策略注册, 不需要计算
        if (CollUtil.isEmpty(strategyRegisterIds)){
            return;
        }

        // 获取策略注册对象集合
        Map<Long, StrategyRegister> strategyRegisterMap = calculateCache.getStrategyRegisterMap();
        Map<Long, StrategyRegister> srMap = strategyRegisterIds.stream()
                .map(strategyRegisterMap::get)
                .collect(Collectors.toMap(StrategyRegister::getId, o -> o));

        // 根据策略注册Id对订单明细进行分组
        Map<Long, List<OrderDetailCache>> odMap = new TreeMap<>();
        for (Long id : strategyRegisterIds) {
            List<OrderDetailCache> orderDetailParams = details.stream()
                    .filter(detail -> detail.getStrategyRegisterIds().contains(id))
                    .collect(Collectors.toList());
            odMap.put(id, orderDetailParams);
        }

        // 遍历活动策略进行计算
        for (Long strategyRegisterId : strategyRegisterIds) {
            List<OrderDetailCache> list = odMap.get(strategyRegisterId);
            calculateService.calculateChoose(srMap.get(strategyRegisterId),list, calculateCache);
        }
    }

    /**
     * 优惠券计算
     */
    private void calculateCouponPrice(OrderCache orderCache, CalculateCache calculateCache){
        // 获取优惠
        List<Coupon> coupons = orderCache.getCoupons();
        if (CollUtil.isEmpty(coupons)){
            return;
        }

        List<OrderDetailCache> details = orderCache.getDetails();
        Map<Long, StrategyRegister> strategyRegisterMap = calculateCache.getStrategyRegisterMap();
        Map<Long, CouponTemplate> couponTemplateMap = calculateCache.getCouponTemplateMap();

        // 遍历优惠卷 进行分组并计算
        for (Coupon coupon : coupons) {
            StrategyRegister strategyRegister = strategyRegisterMap.get(coupon.getStrategyRegisterId());
            CouponTemplate couponTemplate = couponTemplateMap.get(coupon.getTemplateId());
            // 匹配到优惠券适用的订单明细组
            List<OrderDetailCache> orderDetails = details.stream()
                    .filter(detail -> matchRuleService.detailMatch(detail,couponTemplate.getMatchRules()))
                    .collect(Collectors.toList());
            calculateService.calculateCoupon(strategyRegister,orderDetails,coupon,orderCache,calculateCache);
        }
    }
}
