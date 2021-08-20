package cn.bootx.goods.core.category.convert;

import cn.bootx.goods.core.category.entity.Category;
import cn.bootx.goods.dto.category.CategoryDto;
import cn.bootx.goods.param.category.CategoryParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

@Mapper
public interface CategoryConvert {
    CategoryConvert CONVERT = Mappers.getMapper(CategoryConvert.class);
    @Mappings({})
    CategoryDto convert(Category in);

    @Mappings({})
    Category convert(CategoryParam in);

    @Mappings({})
    Category convert(CategoryDto in);
}
