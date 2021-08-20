package cn.bootx.sales.core.strategy.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.dto.strategy.StrategyConfigValueDto;
import cn.bootx.sales.param.strategy.StrategyConfigValueParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.beans.BeanUtils;

/**   
* 策略配置值
* @author xxm  
* @date 2020/10/11 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_strategy_config_value")
public class StrategyConfigValue extends MpBaseEntity implements EntityBaseFunction<StrategyConfigValueDto> {

    /** 策略id */
    private Long strategyId;

    /** 策略注册id */
    private Long strategyRegisterId;

    /** 策略配置 */
    private Long strategyConfigId;

    /** 策略key */
    @TableField("`key`")
    private String key;

    /** 值 */
    private String value;


    public static StrategyConfigValue init(StrategyConfigValueDto param) {
        StrategyConfigValue entity = new StrategyConfigValue();
        BeanUtils.copyProperties(param, entity);
        return entity;
    }

    public static StrategyConfigValue init(StrategyConfigValueParam param) {
        StrategyConfigValue entity = new StrategyConfigValue();
        BeanUtils.copyProperties(param, entity);
        return entity;
    }

    @Override
    public StrategyConfigValueDto toDto() {
        StrategyConfigValueDto dto = new StrategyConfigValueDto();
        BeanUtils.copyProperties(this, dto);
        return dto;
    }

}
