package cn.bootx.sales.core.strategy.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.code.StrategyCode;
import cn.bootx.sales.core.strategy.convert.StrategyConvert;
import cn.bootx.sales.dto.strategy.StrategyDto;
import cn.bootx.sales.param.strategy.StrategyParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 策略定义
* @author xxm
* @date 2020/10/11
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_strategy")
public class Strategy extends MpBaseEntity implements EntityBaseFunction<StrategyDto> {

    /** 策略名称 */
    private String name;

    /** 唯一编码 */
    private String code;

    /** 描述 */
    private String description;

    /**
     * 目标类型
     * @see StrategyCode
     */
    private int targetType;

    /**
     * 应用的引擎类型
     * @see StrategyCode
     */
    private int engineType;

    /** 策略计算脚本 */
    private String ruleScript;

    /** 可用状态 */
    private Integer state;

    public static Strategy init(StrategyParam in) {
        return StrategyConvert.CONVERT.convert(in);
    }

    @Override
    public StrategyDto toDto() {
        return StrategyConvert.CONVERT.convert(this);
    }

}
