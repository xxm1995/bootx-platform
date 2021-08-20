package cn.bootx.sales.core.match.service;

import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.core.check.convert.OrderConvert;
import cn.bootx.sales.core.match.dao.MatchRuleManager;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.core.match.handler.func.FeatureHandler;
import cn.bootx.sales.dto.match.FeaturePoints;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 匹配规则关系管理
 * @author xxm
 * @date 2021/5/8
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class MatchRuleService {

    private final MatchRuleManager matchRuleManager;
    private final List<FeatureHandler> featureHandlers;

    /**
     * 查询全局适用优惠活动
     */
    public List<MatchRuleConfig> findGlobalActivityMatch(){
        return matchRuleManager.findGlobalActivityMatch();
    }

    /**
     * 查询适用的的优惠活动
     */
    public List<MatchRuleConfig> findByActivityMatch(List<FeaturePoints> featurePoints) {
        return matchRuleManager.findByActivityMatch(featurePoints);
    }

    /**
     * 订单明细是否有匹配规则匹配到
     */
    public boolean detailMatch(OrderDetailCheckParam detailCheckParam, List<MatchRuleConfig> matchRules){
        for (MatchRuleConfig matchRule : matchRules) {
            // 任意配置匹配成功
            if (featureHandlers.stream().anyMatch(featureHandler -> featureHandler.match(detailCheckParam,matchRule))){
                return true;
            }
        }
        return false;
    }

    /**
     * 订单明细是否有匹配规则匹配到
     */
    public boolean detailMatch(OrderDetailCache orderDetailCache, List<MatchRuleConfig> matchRules){
        return this.detailMatch(OrderConvert.INSTANCE.convert(orderDetailCache),matchRules);
    }

    /**
     * 多个订单明细是否有匹配规则匹配到
     */
    public boolean orderMatch(OrderCheckParam orderCheckParam, List<MatchRuleConfig> matchRules){
        List<OrderDetailCheckParam> list = orderCheckParam.getDetails();
        return list.stream().anyMatch(detailCheckParam -> this.detailMatch(detailCheckParam,matchRules));
    }

    /**
     * 多个订单明细是否有匹配规则匹配到
     */
    public boolean orderMatch(OrderCache orderCache, List<MatchRuleConfig> matchRules){
        return this.orderMatch(OrderConvert.INSTANCE.convert(orderCache),matchRules);
    }
}
