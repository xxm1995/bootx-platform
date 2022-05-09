package cn.bootx.goods.core.category.convert;

import cn.bootx.goods.core.category.entity.CategoryParameter;
import cn.bootx.goods.dto.category.CategoryParameterDto;
import cn.bootx.goods.param.category.CategoryParameterParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 类目参数
 * @author xxm
 * @date 2022-05-09
 */
@Mapper
public interface CategoryParameterConvert {
    CategoryParameterConvert CONVERT = Mappers.getMapper(CategoryParameterConvert.class);

    CategoryParameter convert(CategoryParameterParam in);

    CategoryParameterDto convert(CategoryParameter in);

}