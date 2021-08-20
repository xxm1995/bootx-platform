package cn.bootx.sales.core.calculate.factory;

import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateBufferService;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import cn.hutool.core.collection.CollUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 计算工厂
 * @author xxm
 * @date 2020/11/19
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class CalculateFactory {
    private final CalculateBufferService calculateBufferService;

    /**
     * 为了同时返回订单dto和缓存
     */
    @AllArgsConstructor
    @Getter
    public static class OrderAndBuffer {
        private final OrderCache orderCache;
        private final CalculateCache calculateCache;
    }

    /**
     * 构建订单和缓存
     */
    public OrderAndBuffer buildOrderCache(OrderCheckParam orderParam){

        /* 构建活动策略缓存 */
        CalculateCache calculateCache = new CalculateCache();

        // 构建活动和优惠券缓存
        calculateBufferService.buildActivityCache(orderParam,calculateCache);
        calculateBufferService.buildCouponCache(orderParam,calculateCache);

        // 构建订单缓存
        OrderCache orderDto = this.buildOrderCache(orderParam, calculateCache);

        return new OrderAndBuffer(orderDto, calculateCache);
    }
    /**
     * 构建订单dto 带缓存
     */
    public OrderCache buildOrderCache(OrderCheckParam orderParam, CalculateCache calculateCache){
        OrderCache orderCache = new OrderCache();
        // 优惠券处理
        List<Long> couponIds = orderParam.getCouponIds();
        if (CollUtil.isNotEmpty(couponIds)){
            orderCache.setCoupons(calculateCache.getCoupons());
        }
        // 构建订单及明细
        BeanUtil.copyProperties(orderParam,orderCache, CopyOptions.create().ignoreNullValue());
        List<OrderDetailCache> details = orderParam.getDetails()
                .stream()
                .map(param -> this.buildOrderDetailCache(param,calculateCache))
                .collect(Collectors.toList());

        return orderCache.setDetails(details);
    }

    /**
     * 构建订单明细dto 带缓存
     */
    private OrderDetailCache buildOrderDetailCache(OrderDetailCheckParam param, CalculateCache calculateCache){
        OrderDetailCache dto = new OrderDetailCache();
        BeanUtil.copyProperties(param,dto,CopyOptions.create().ignoreNullValue());

        Map<Long, StrategyRegister> strategyRegisterMap = calculateCache.getStrategyRegisterMap();
        Map<Long, Activity> activityMap = calculateCache.getActivityMap();
        List<Long> activityIds = param.getActivityIds();

        // 活动存在则添加
        if (CollUtil.isNotEmpty(activityIds)) {
            // 活动
            List<Activity> activities = activityIds.stream()
                    .map(activityMap::get)
                    .collect(Collectors.toList());
            dto.setActivities(activities);
            dto.setActivityIds(activityIds);

            // 策略注册
            List<Long> strategyRegisterIds = activityIds.stream()
                    .map(activityMap::get)
                    .map(Activity::getStrategyRegisterId)
                    .collect(Collectors.toList());
            List<StrategyRegister> strategyRegisters = strategyRegisterIds.stream()
                    .map(strategyRegisterMap::get)
                    .collect(Collectors.toList());
            dto.setStrategyRegisterIds(strategyRegisterIds);
            dto.setStrategyRegisters(strategyRegisters);
        }
        dto.setTotalAmount(BigDecimalUtil.multiply(BigDecimal.valueOf(dto.getNum()),dto.getGoodsPrice()));
        return dto;
    }

}
