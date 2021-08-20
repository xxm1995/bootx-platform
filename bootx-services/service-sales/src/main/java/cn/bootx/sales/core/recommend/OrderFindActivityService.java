package cn.bootx.sales.core.recommend;

import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.core.activity.dao.ActivityManager;
import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.check.injector.CheckRuleInjector;
import cn.bootx.sales.core.check.service.activity.ActivitySelectCheckService;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.core.match.service.FeaturePointService;
import cn.bootx.sales.core.match.service.MatchRuleService;
import cn.bootx.sales.dto.match.FeaturePoints;
import cn.bootx.sales.dto.order.GoodsActivityResult;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 优惠活动匹配
 * @author xxm
 * @date 2020/12/4
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderFindActivityService {
    private final CheckRuleInjector checkRuleInjector;
    private final ActivityManager activityManager;

    private final MatchRuleService matchRuleService;
    private final ActivitySelectCheckService activitySelectCheckService;
    private final FeaturePointService featureExtractService;

    /**
     * 传入订单,返回所有可用的活动
     */
    public List<GoodsActivityResult> findActivity(OrderCheckParam orderParam){
        // 提取特征点
        List<FeaturePoints> featurePoints = featureExtractService.extractFeaturePoints(orderParam.getDetails());

        // 获取订单初步匹配的活动 (全局适用和特征点匹配)
        List<MatchRuleConfig> globalActivityMatch = matchRuleService.findGlobalActivityMatch();
        List<MatchRuleConfig> matchActivityMatch = matchRuleService.findByActivityMatch(featurePoints);
        List<MatchRuleConfig> allActivityMatch = new ArrayList<>(globalActivityMatch);
        allActivityMatch.addAll(matchActivityMatch);

        // 查询出对应的活动
        List<Long> srIds = allActivityMatch.stream()
                .map(MatchRuleConfig::getStrategyRegisterId)
                .distinct()
                .collect(Collectors.toList());
        List<Activity> activities = activityManager.findByStrategyRegister(srIds);
        Map<Long, Activity> activityBySrMap = activities.stream()
                .collect(Collectors.toMap(Activity::getStrategyRegisterId, o -> o));
        // 注入检查规则
        checkRuleInjector.injectionActivity(activities, CheckRuleCode.RULE_TYPE_ACTIVITY_CHECK);

        // 组装商品适用活动
        List<GoodsActivityResult> activityResults = new ArrayList<>();
        for (OrderDetailCheckParam detail : orderParam.getDetails()) {
            // 先根据特征点匹配
            List<Activity> matchActivities = featureExtractService.matchAndGetActivity(detail, allActivityMatch, activityBySrMap);
            // 然后根据检查策略过滤
            List<Activity> list = activitySelectCheckService.activitiesCheck(detail, orderParam, matchActivities);
            GoodsActivityResult goodsActivityResult = new GoodsActivityResult()
                    .setSkuId(detail.getSkuId())
                    .setActivities(list.stream().map(Activity::simple).collect(Collectors.toList()));
            activityResults.add(goodsActivityResult);
        }
        return activityResults;
    }
}
