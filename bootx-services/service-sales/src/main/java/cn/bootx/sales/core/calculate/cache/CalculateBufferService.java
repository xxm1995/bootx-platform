package cn.bootx.sales.core.calculate.cache;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.core.activity.dao.ActivityManager;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.coupon.dao.CouponManager;
import cn.bootx.sales.core.coupon.dao.CouponTemplateManager;
import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.core.coupon.entity.CouponTemplate;
import cn.bootx.sales.core.match.injector.MatchRuleInjector;
import cn.bootx.sales.core.strategy.dao.StrategyConfigValueManager;
import cn.bootx.sales.core.strategy.dao.StrategyManager;
import cn.bootx.sales.core.strategy.dao.StrategyRegisterManager;
import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.bootx.sales.core.strategy.entity.StrategyConfigValue;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**   
* 计算缓存服务
* @author xxm  
* @date 2020/12/5 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class CalculateBufferService {
    private final MatchRuleInjector matchRuleInjector;

    private final StrategyRegisterManager strategyRegisterManager;
    private final StrategyManager strategyManager;
    private final CouponManager couponManager;
    private final ActivityManager activityManager;
    private final CouponTemplateManager couponTemplateManager;
    private final StrategyConfigValueManager strategyConfigValueManager;


    /**
     * 构建优惠券缓存
     */
    public void buildCouponCache(OrderCheckParam orderParam, CalculateCache calculateCache) {
        // 优惠券处理并构建缓存
        List<Long> couponIds = orderParam.getCouponIds();
        if (CollUtil.isNotEmpty(couponIds)){
            List<Coupon> coupons = couponManager.findAllByIds(couponIds);
            // 判断ID是否有问题
            if (coupons.size()!=couponIds.size()){
                throw new BizException("优惠券有问题");
            }
            calculateCache.appendCoupon(coupons);

            // 补充优惠券相关缓存(关联策略注册和策略)
            List<CouponTemplate> couponTemplates = couponTemplateManager.findAllByIds(coupons.stream().map(Coupon::getTemplateId).distinct().collect(Collectors.toList()));
            calculateCache.appendCouponTemplate(couponTemplates);
            List<Long> strategyRegisterIds = couponTemplates.stream()
                    .map(CouponTemplate::getStrategyRegisterId)
                    .distinct()
                    .collect(Collectors.toList());
            this.buildStrategyCache(calculateCache,strategyRegisterIds);

            // 获取优惠券模板对应的匹配规则
            matchRuleInjector.injectionTemplate(couponTemplates);
        }
    }

    /**
     * 构建活动的策略注册缓存 根据活动id
     */
    public void buildActivityCache(OrderCheckParam orderParam, CalculateCache calculateCache){
        List<Long> activityIds = orderParam.getDetails().stream()
                .map(OrderDetailCheckParam::getActivityIds)
                .filter(CollUtil::isNotEmpty)
                .flatMap(Collection::stream)
                .distinct()
                .collect(Collectors.toList());
        List<Activity> activities = activityManager.findAllByIds(activityIds);
        // 判断ID是否有问题
        if (activityIds.size()!=activities.size()){
            throw new BizException("活动有问题");
        }

        calculateCache.appendActivity(activities);
        // 补充优惠活动相关缓存(关联策略注册和策略)
        List<Long> strategyRegisterIds = activities.stream()
                .map(Activity::getStrategyRegisterId)
                .collect(Collectors.toList());
        this.buildStrategyCache(calculateCache,strategyRegisterIds);

        // 获取优惠活动对应的匹配规则
        matchRuleInjector.injectionActivity(activities);
    }


    /**
     * 构建策略缓存 已有缓存
     */
    private void buildStrategyCache(CalculateCache calculateCache, List<Long> strategyRegisterIds){
        this.buildCacheByRegister(calculateCache,strategyRegisterManager.findAllByIds(strategyRegisterIds));
    }

    /**
     * 构建策略缓存 已有策略注册
     */
    @SafeVarargs
    private final void buildCacheByRegister(CalculateCache calculateCache, List<StrategyRegister>... strategyRegisters){
        // 策略注册
        calculateCache.appendStrategyRegister(strategyRegisters);

        // 策略
        Map<Long, StrategyRegister> strategyRegisterMap = calculateCache.getStrategyRegisterMap();
        List<Long> strategyIds = strategyRegisterMap.values()
                .stream().map(StrategyRegister::getStrategyId)
                .collect(Collectors.toList());
        List<Strategy> strategies = strategyManager.findAllByIds(strategyIds);
        calculateCache.appendStrategy(strategies);

        // 参数
        List<Long> srIds = strategyRegisterMap.values()
                .stream().map(StrategyRegister::getId)
                .collect(Collectors.toList());
        List<StrategyConfigValue> strategyConfigValues = strategyConfigValueManager.findAllStrategyRegisterIds(srIds);

        calculateCache.appendStrategyConfigValue(strategyConfigValues);
        /* 结束 */
    }

}
