package cn.bootx.sales.core.match.service;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.core.match.handler.func.FeatureHandler;
import cn.bootx.sales.dto.match.FeaturePoints;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 特征点输出
 * @author xxm
 * @date 2021/5/18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class FeaturePointService {
    private final List<FeatureHandler> featureHandlers;

    /**
     * 提取特征点
     */
    public List<FeaturePoints> extractFeaturePoints(List<OrderDetailCheckParam> detailCheckParams){
        return featureHandlers.stream()
                .map(featureExtract -> featureExtract.extract(detailCheckParams))
                .distinct()
                .collect(Collectors.toList());
    }

    /**
     * 特征点匹配, 匹配成功返回对应的活动
     */
    public List<Activity> matchAndGetActivity(OrderDetailCheckParam checkParam, List<MatchRuleConfig> activityMatch, Map<Long, Activity> activityBySrMap) {
        return activityMatch.stream()
                .filter(matchRuleConfig -> featureHandlers.stream()
                        .anyMatch(featureHandler -> featureHandler.match(checkParam,matchRuleConfig)))
                .map(MatchRuleConfig::getStrategyRegisterId)
                .distinct()
                .map(activityBySrMap::get)
                .collect(Collectors.toList());
    }

}
