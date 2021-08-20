package cn.bootx.sales.core.strategy.convert;

import cn.bootx.sales.core.strategy.entity.Strategy;
import cn.bootx.sales.core.strategy.entity.StrategyConfig;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.strategy.StrategyConfigDto;
import cn.bootx.sales.dto.strategy.StrategyDto;
import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import cn.bootx.sales.param.strategy.StrategyConfigParam;
import cn.bootx.sales.param.strategy.StrategyParam;
import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 策略相关转换类
* @author xxm  
* @date 2021/8/11 
*/
@Mapper
public interface StrategyConvert {
    StrategyConvert CONVERT = Mappers.getMapper(StrategyConvert.class);

    @Mappings({})
    StrategyDto convert(Strategy in);

    @Mappings({})
    Strategy convert(StrategyParam in);

    @Mappings({})
    Strategy convert(StrategyDto in);

    @Mappings({})
    StrategyConfig convert(StrategyConfigDto in);

    @Mappings({})
    StrategyConfig convert(StrategyConfigParam in);

    @Mappings({})
    StrategyConfigDto convert(StrategyConfig in);

    @Mappings({})
    StrategyRegister convert(StrategyRegisterParam in);

    @Mappings({})
    StrategyRegister convert(StrategyRegisterDto in);

    @Mappings({})
    StrategyRegisterDto convert(StrategyRegister in);
}
