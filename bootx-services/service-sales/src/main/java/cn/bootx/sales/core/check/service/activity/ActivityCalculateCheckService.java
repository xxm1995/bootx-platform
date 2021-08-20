package cn.bootx.sales.core.check.service.activity;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.calculate.cache.CalculateCache;
import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.core.check.handler.activity.ActivityCheckHandler;
import cn.bootx.sales.core.check.injector.CheckRuleInjector;
import cn.bootx.sales.core.check.rule.CheckRuleHandlerAdapter;
import cn.bootx.sales.dto.check.CheckRuleResult;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 活动计算时检查
 * @author xxm
 * @date 2020/11/26
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ActivityCalculateCheckService {
    private final ActivityCheckHandler activityCheckHandler;
    private final CheckRuleHandlerAdapter checkRuleHandlerAdapter;
    private final CheckRuleInjector checkRuleInjector;

    /**
     * 活动检查(公共)
     */
    public void checkCommons(OrderCache orderDto, CalculateCache calculateCache){

        // 通用检查 时间检查
        activityCheckHandler.checkTime(calculateCache.getActivities());
        // 检查 明细策略
        List<OrderDetailCache> details = orderDto.getDetails();
        for (OrderDetailCache detail : details) {
            List<Activity> activities = detail.getActivities();
            // 无策略注册不检查
            if (CollUtil.isEmpty(activities)){
                continue;
            }
            // 活动匹配检查
            activityCheckHandler.checkMatch(detail,activities);
            // 同类互斥检查
            activityCheckHandler.checkMutex(activities,calculateCache);
        }
    }

    /**
     * 根据配置的规则进行检查
     */
    public void checkByRule(OrderCache orderDto, CalculateCache calculateCache) {

        // 有检测策略的订单明细
        List<OrderDetailCache> details = orderDto.getDetails()
                .stream()
                .filter(detail-> CollUtil.isNotEmpty(detail.getActivities()))
                .collect(Collectors.toList());

        // 填充检测规则
        List<Activity> activities = details.stream()
                .map(OrderDetailCache::getActivities)
                .flatMap(Collection::stream)
                .collect(Collectors.toList());
        checkRuleInjector.injectionActivity(activities, CheckRuleCode.RULE_TYPE_ACTIVITY_CHECK);

        // 多重循环进行遍历和检测
        for (OrderDetailCache detail : details) {
            for (Activity activityDto : detail.getActivities()) {
                List<CheckRuleConfig> useCheckRules = activityDto.getCheckRules();
                if (CollUtil.isEmpty(useCheckRules)){
                    continue;
                }
                for (CheckRuleConfig checkRule : useCheckRules) {
                    CheckRuleResult checkRuleResult = checkRuleHandlerAdapter.activityUseCheck(checkRule, activityDto, detail, orderDto, calculateCache);
                    if (!checkRuleResult.isPass()){
                       throw new BizException(checkRuleResult.getMsg());
                   }
                }
            }
        }
    }
}
