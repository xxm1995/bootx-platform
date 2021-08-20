package cn.bootx.sales.core.calculate.cache;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.hutool.core.map.MapUtil;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 计算时策略缓存,包含计算时所有用到的数据, 其中的数据不可以进行修改和删除
 * @author xxm
 * @date 2020/10/26
 */
@Getter
@Accessors(chain = true)
public class CalculateCache {

    /** 订单缓存 */
    @Setter
    private OrderCache order;

    /** 策略缓存 */
    private Map<Long, Strategy> strategyMap;

    /** 策略注册缓存 */
    private Map<Long, StrategyRegister> strategyRegisterMap;

    /** 策略注册缓存 */
    private Map<Long, List<StrategyConfigValue>> strategyConfigValueMap;

    /** 优惠活动 */
    private Map<Long, Activity> activityMap;

    /** 优惠券 */
    private Map<Long, Coupon> couponMap;

    /** 优惠券模板 */
    private Map<Long, CouponTemplate> couponTemplateMap;

    /** 订单使用到的优惠活动 */
    @Setter
    private List<Activity> activities;

    /** 订单使用到的优惠券 */
    @Setter
    private List<Coupon> coupons;

    /** 订单使用到的优惠券模板 */
    @Setter
    private List<CouponTemplate> couponTemplates;

    /** 订单使用到的策略注册 */
    @Setter
    private List<StrategyRegister> strategyRegisters;


    /**
     * 追加策略
     */
    @SuppressWarnings("UnusedReturnValue")
    public CalculateCache appendStrategy(List<Strategy> strategies){
        if (MapUtil.isEmpty(this.strategyMap)){
            this.strategyMap = new HashMap<>();
        }
        Map<Long, Strategy> collect = strategies.stream()
                .collect(Collectors.toMap(Strategy::getId,o->o));
        strategyMap.putAll(collect);
        return this;
    }

    /**
     * 追加策略注册
     */
    @SafeVarargs
    @SuppressWarnings("UnusedReturnValue")
    public final CalculateCache appendStrategyRegister(List<StrategyRegister>... list){
        if (MapUtil.isEmpty(this.strategyRegisterMap)){
            this.strategyRegisterMap = new HashMap<>();
            this.strategyRegisters = new ArrayList<>();
        }
        for (List<StrategyRegister> strategyRegisters : list) {
            Map<Long, StrategyRegister> collect = strategyRegisters.stream()
                    .collect(Collectors.toMap(StrategyRegister::getId,o->o));
            this.strategyRegisterMap.putAll(collect);
            this.strategyRegisters.addAll(strategyRegisters);

        }
        return this;
    }

    /**
     * 追加策略注册参数
     */
    @SuppressWarnings("UnusedReturnValue")
    public CalculateCache appendStrategyConfigValue( List<StrategyConfigValue> strategyRegisters){
        if (MapUtil.isEmpty(this.strategyConfigValueMap)){
            this.strategyConfigValueMap = new HashMap<>();
        }
        Map<Long, List<StrategyConfigValue>> collect = strategyRegisters.stream()
                .collect(Collectors.groupingBy(StrategyConfigValue::getStrategyRegisterId));
        this.strategyConfigValueMap.putAll(collect);
        return this;
    }

    /**
     * 追加活动
     */
    @SuppressWarnings("UnusedReturnValue")
    public CalculateCache appendActivity(List<Activity> activities){
        if (MapUtil.isEmpty(this.activityMap)){
            this.activityMap = new HashMap<>();
            this.activities = new ArrayList<>();
        }
        Map<Long,Activity> collect = activities.stream()
                .collect(Collectors.toMap(Activity::getId,o -> o));
        this.activityMap.putAll(collect);
        this.activities.addAll(activities);
        return this;
    }

    /**
     * 追加优惠券
     */
    @SuppressWarnings("UnusedReturnValue")
    public CalculateCache appendCoupon(List<Coupon> coupons){
        if (MapUtil.isEmpty(this.couponMap)){
            this.couponMap = new HashMap<>();
            this.coupons = new ArrayList<>();
        }
        Map<Long,Coupon> collect = coupons.stream()
                .collect(Collectors.toMap(Coupon::getId,o -> o));
        this.couponMap.putAll(collect);
        this.coupons.addAll(coupons);
        return this;
    }

    /**
     * 追加优惠券模板
     */
    @SuppressWarnings("UnusedReturnValue")
    public CalculateCache appendCouponTemplate( List<CouponTemplate> couponTemplates){
        if (MapUtil.isEmpty(this.couponTemplateMap)){
            this.couponTemplateMap = new HashMap<>();
            this.couponTemplates = new ArrayList<>();
        }
        Map<Long,CouponTemplate> collect = couponTemplates.stream()
                .collect(Collectors.toMap(CouponTemplate::getId,o -> o));
        this.couponTemplateMap.putAll(collect);
        this.couponTemplates.addAll(couponTemplates);
        return this;
    }

}
