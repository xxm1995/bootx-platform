package cn.bootx.goods.core.category.convert;

import cn.bootx.goods.core.category.entity.CategoryParameterGroup;
import cn.bootx.goods.dto.category.CategoryParameterGroupDto;
import cn.bootx.goods.param.category.CategoryParameterGroupParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 类目参数组
 * @author xxm
 * @date 2022-05-09
 */
@Mapper
public interface CategoryParameterGroupConvert {
    CategoryParameterGroupConvert CONVERT = Mappers.getMapper(CategoryParameterGroupConvert.class);

    CategoryParameterGroup convert(CategoryParameterGroupParam in);

    CategoryParameterGroupDto convert(CategoryParameterGroup in);

}