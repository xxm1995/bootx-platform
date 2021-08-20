package cn.bootx.sales.core.strategy.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.core.strategy.convert.StrategyConvert;
import cn.bootx.sales.dto.strategy.StrategyConfigDto;
import cn.bootx.sales.param.strategy.StrategyConfigParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;


/**
* 策略配置
* @author xxm  
* @date 2020/10/11 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_strategy_config")
public class StrategyConfig extends MpBaseEntity implements EntityBaseFunction<StrategyConfigDto> {

    /** 策略id */
    private Long strategyId;

    /** 参数名称 */
    @TableField("`key`")
    private String key;

    /** 名称 */
    private String name;

    /** 类型 */
    private String type;

    /** 描述 */
    private String description;

    public static StrategyConfig init(StrategyConfigDto in) {
        return StrategyConvert.CONVERT.convert(in);
    }

    public static StrategyConfig init(StrategyConfigParam in) {
        return StrategyConvert.CONVERT.convert(in);
    }

    @Override
    public StrategyConfigDto toDto() {
        return StrategyConvert.CONVERT.convert(this);
    }

}
