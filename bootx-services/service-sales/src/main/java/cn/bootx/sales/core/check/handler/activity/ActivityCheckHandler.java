package cn.bootx.sales.core.check.handler.activity;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.core.util.LocalDateTimeUtils;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.match.service.MatchRuleService;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

/**
 * 策略基础(公共)检查
 * @author xxm
 * @date 2020/12/7
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ActivityCheckHandler {
    private final MatchRuleService matchRuleService;

    /**
     * 活动互斥检查
     */
    public void checkMutex(List<Activity> activities, CalculateCache calculateCache){
        Map<Long, StrategyRegister> strategyRegisterMap = calculateCache.getStrategyRegisterMap();
        // 同类互斥检查 满减/打折/立减 同类策略不可叠加
        long sameClassCount = activities.stream()
                .map(Activity::getStrategyRegisterId)
                .map(strategyRegisterMap::get)
                .map(StrategyRegister::getStrategyId)
                .distinct()
                .count();
        long classCount = activities.stream()
                .map(Activity::getStrategyRegisterId)
                .map(strategyRegisterMap::get)
                .map(StrategyRegister::getStrategyId)
                .count();
        if (sameClassCount != classCount){
            throw new BizException("同类活动互斥检查未通过");
        }
    }


    /**
     * 可用时间检查
     */
    public void checkTime(List<Activity> activities){
        for (Activity activity : activities) {
            if (!LocalDateTimeUtils.between(LocalDateTime.now(), activity.getStartTime(), activity.getEndTime())) {
                throw new BizException("活动时间不符合");
            }
        }
    }

    /**
     * 活动特征匹配检查
     */
    public void checkMatch(OrderDetailCache detail, List<Activity> activities) {
        for (Activity activity : activities) {
            // 如果有不通过的就抛出错误
            if (!matchRuleService.detailMatch(detail, activity.getMatchRules())){
                throw new BizException("活动不匹配");
            }
        }
    }
}
