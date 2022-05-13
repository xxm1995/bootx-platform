package cn.bootx.goods.core.category.convert;

import cn.bootx.goods.core.category.entity.Specification;
import cn.bootx.goods.dto.category.SpecificationDto;
import cn.bootx.goods.param.category.SpecificationParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 规格
 * @author xxm
 * @date 2022-05-09
 */
@Mapper
public interface SpecificationConvert {
    SpecificationConvert CONVERT = Mappers.getMapper(SpecificationConvert.class);

    Specification convert(SpecificationParam in);

    SpecificationDto convert(Specification in);

}