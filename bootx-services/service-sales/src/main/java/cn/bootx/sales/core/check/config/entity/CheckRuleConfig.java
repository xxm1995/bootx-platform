package cn.bootx.sales.core.check.config.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.code.CheckRuleCode;
import cn.bootx.sales.code.StrategyCode;
import cn.bootx.sales.core.check.config.convert.CheckRuleConvert;
import cn.bootx.sales.dto.check.CheckRuleDto;
import cn.bootx.sales.param.strategy.CheckRuleParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 检查规则配置
 * @author xxm
 * @date 2020/12/1
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_check_rule")
public class CheckRuleConfig extends MpBaseEntity implements EntityBaseFunction<CheckRuleDto>,Comparable<CheckRuleConfig> {

    /** 策略注册id */
    private Long strategyRegisterId;

    /** 策略id */
    private Long strategyId;

    /**
     * 策略类型 活动/优惠券
     * @see CheckRuleCode
     */
    private int registerType;

    /**
     * 检查类型规则
     * @see CheckRuleCode
     */
    private int ruleType;

    /** 优先级 */
    private int priority;

    /** 规则名称 */
    private String name;

    /**
     * 规则code
     * @see CheckRuleCode.Activity
     * @see CheckRuleCode.Coupon
     */
    private String code;

    /**
     * 类型
     * @see StrategyCode
     */
    @TableField(exist = false)
    private int engineType;

    /** 策略脚本 */
    @TableField(exist = false)
    private String ruleScript;

    /** 附加对象 json */
    private String addition;

    public static CheckRuleConfig init(CheckRuleDto dto) {
        return CheckRuleConvert.INSTANCE.convert(dto);
    }

    public static CheckRuleConfig init(CheckRuleParam dto) {
        return CheckRuleConvert.INSTANCE.convert(dto);
    }

    @Override
    public CheckRuleDto toDto() {
        return CheckRuleConvert.INSTANCE.convert(this);
    }

    @Override
    public int compareTo(CheckRuleConfig o) {
        return Integer.compare(this.priority, o.priority);
    }
}
