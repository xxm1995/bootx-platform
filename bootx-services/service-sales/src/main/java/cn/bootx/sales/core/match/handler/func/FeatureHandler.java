package cn.bootx.sales.core.match.handler.func;

import cn.bootx.sales.code.MatchTypeCode;
import cn.bootx.sales.core.match.entity.MatchRuleConfig;
import cn.bootx.sales.dto.match.FeaturePoint;
import cn.bootx.sales.dto.match.FeaturePoints;
import cn.bootx.sales.param.order.OrderDetailCheckParam;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**   
* 特征点处理接口
* @author xxm
* @date 2021/5/18 
*/
public interface FeatureHandler {

    /**
     * 是否启用
     */
    default boolean use(MatchRuleConfig matchRuleConfig){
        return Objects.equals(matchRuleConfig.getFeatureType(),getFeatureType());
    }

    /**
     * 特征类型
     */
    String getFeatureType();

    /**
     * 特征点
     */
    String getFeaturePoint(OrderDetailCheckParam checkParam);

    /**
     * 抽取特征点
     */
    default FeaturePoint extract(OrderDetailCheckParam checkParam){
        return new FeaturePoint(getFeatureType(),getFeaturePoint(checkParam));
    }

    /**
     * 抽取特征点
     */
    default FeaturePoints extract(List<OrderDetailCheckParam> checkParams){
        List<String> points = checkParams.stream()
                .map(this::getFeaturePoint)
                .collect(Collectors.toList());
        return new FeaturePoints(getFeatureType(),points);
    }

    /**
     * 匹配特征点(默认eq匹配)
     */
    default boolean match(OrderDetailCheckParam checkParam,MatchRuleConfig matchRuleConfig){
        if (!use(matchRuleConfig)){
            return false;
        }
        String matchType = matchRuleConfig.getMatchType();
        if (Objects.equals(matchType, MatchTypeCode.EQ)){
            return Objects.equals(getFeaturePoint(checkParam),matchRuleConfig.getFeaturePoint());
        }
        if (Objects.equals(matchType, MatchTypeCode.NE)){
            return !Objects.equals(getFeaturePoint(checkParam),matchRuleConfig.getFeaturePoint());
        }
        return false;
    }
}
