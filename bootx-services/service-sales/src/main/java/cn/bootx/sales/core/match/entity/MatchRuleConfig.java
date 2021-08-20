package cn.bootx.sales.core.match.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.code.MatchRuleCode;
import cn.bootx.sales.code.MatchTypeCode;
import cn.bootx.sales.core.match.convert.MatchRuleConvert;
import cn.bootx.sales.dto.match.MatchRuleDto;
import cn.bootx.sales.param.strategy.MatchRuleParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 匹配关系配置
 * @author xxm
 * @date 2020/12/3
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_match_rule")
public class MatchRuleConfig extends MpBaseEntity implements EntityBaseFunction<MatchRuleDto> {

    /** 策略注册id */
    private Long strategyRegisterId;

    /**
     * @see MatchRuleCode
     * 外部关联类型 活动/优惠券
     */
    private int registerType;

    /** 特征类型 */
    private String featureType;

    /** 特征值 */
    private String featurePoint;

    /**
     * 匹配类型
     * @see MatchTypeCode
     */
    private String matchType;

    public static MatchRuleConfig init(MatchRuleDto dto) {
        return MatchRuleConvert.INSTANCE.convert(dto);
    }

    public static MatchRuleConfig init(MatchRuleParam param) {
        return MatchRuleConvert.INSTANCE.convert(param);
    }

    @Override
    public MatchRuleDto toDto() {
        return MatchRuleConvert.INSTANCE.convert(this);
    }
}
