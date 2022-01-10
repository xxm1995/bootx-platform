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

    StrategyDto convert(Strategy in);

    Strategy convert(StrategyParam in);

    Strategy convert(StrategyDto in);

    StrategyConfig convert(StrategyConfigDto in);

    StrategyConfig convert(StrategyConfigParam in);

    StrategyConfigDto convert(StrategyConfig in);

    StrategyRegister convert(StrategyRegisterParam in);

    StrategyRegister convert(StrategyRegisterDto in);

    StrategyRegisterDto convert(StrategyRegister in);
}
