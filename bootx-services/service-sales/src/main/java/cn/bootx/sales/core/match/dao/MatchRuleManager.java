package cn.bootx.sales.core.match.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.sales.code.MatchTypeCode;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.dto.match.FeaturePoints;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

import static cn.bootx.sales.code.MatchRuleCode.MATCH_ACTIVITY;

/**
 * 匹配规则
 * @author xxm
 * @date 2021/5/8
 */
@Repository
@RequiredArgsConstructor
public class MatchRuleManager extends BaseManager<MatchRuleMapper,MatchRuleConfig> {

    public List<MatchRuleConfig> findByStrategyRegisterIds(List<Long> templateIds) {
        return findAllByFields(MatchRuleConfig::getStrategyRegisterId,templateIds);
    }

    public List<MatchRuleConfig> findByStrategyRegisterId(Long strategyRegisterId){
        return findAllByField(MatchRuleConfig::getStrategyRegisterId,strategyRegisterId);
    }


    /**
     * 全局生效的活动策略(非eq类型,)
     */
    public List<MatchRuleConfig> findGlobalActivityMatch(){
        return lambdaQuery().eq(MatchRuleConfig::getRegisterType,MATCH_ACTIVITY)
                .ne(MatchRuleConfig::getMatchType,MatchTypeCode.EQ)
                .list();
    }

    /**
     * 查询匹配(eq类型)
     */
    public List<MatchRuleConfig> findByActivityMatch(List<FeaturePoints> featurePoints) {
        return lambdaQuery().eq(MatchRuleConfig::getRegisterType, MATCH_ACTIVITY)
                .eq(MatchRuleConfig::getMatchType, MatchTypeCode.EQ)
                // 特征点
                .and(queryWrapper ->{
                    for (FeaturePoints feature : featurePoints) {
                        queryWrapper.or(o ->
                                o.eq(MatchRuleConfig::getFeatureType,feature.getType()).in(MatchRuleConfig::getFeaturePoint,feature.getPoints()));
                    }
                }).list();
    }
}
