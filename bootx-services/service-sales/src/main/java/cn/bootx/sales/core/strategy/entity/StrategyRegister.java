package cn.bootx.sales.core.strategy.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.code.StrategyRegisterCode;
import cn.bootx.sales.core.strategy.convert.StrategyConvert;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 策略注册
* @author xxm  
* @date 2020/10/11 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_strategy_register")
public class StrategyRegister extends MpBaseEntity implements EntityBaseFunction<StrategyRegisterDto> {

    /** 策略id */
    private Long strategyId;

    /** 名称 */
    private String name;

    /** 描述 */
    private String description;

    /**
     * 策略类型(普通/优惠券)
     * @see StrategyRegisterCode
     */
    private Integer strategyType;

    public static StrategyRegister init(StrategyRegisterDto in) {
        return StrategyConvert.CONVERT.convert(in);
    }

    public static StrategyRegister init(StrategyRegisterParam in) {
        return StrategyConvert.CONVERT.convert(in);
    }

    @Override
    public StrategyRegisterDto toDto() {
        return StrategyConvert.CONVERT.convert(this);
    }
}
