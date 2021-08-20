package cn.bootx.sales.core.check.config.convert;

import cn.bootx.sales.core.check.config.entity.CheckRuleConfig;
import cn.bootx.sales.dto.check.CheckRuleDto;
import cn.bootx.sales.param.strategy.CheckRuleParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 转换
* @author xxm
* @date 2021/5/19
*/
@Mapper
public interface CheckRuleConvert {
    CheckRuleConvert INSTANCE = Mappers.getMapper(CheckRuleConvert.class);

    @Mappings({})
    CheckRuleConfig convert(CheckRuleDto in);

    @Mappings({})
    CheckRuleConfig convert(CheckRuleParam in);

    @Mappings({})
    CheckRuleDto convert(CheckRuleConfig in);
}
