package cn.bootx.goods.core.category.convert;

import cn.bootx.goods.core.category.entity.Brand;
import cn.bootx.goods.dto.category.BrandDto;
import cn.bootx.goods.param.category.BrandParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 品牌
 * @author xxm
 * @date 2022-05-09
 */
@Mapper
public interface BrandConvert {
    BrandConvert CONVERT = Mappers.getMapper(BrandConvert.class);

    Brand convert(BrandParam in);

    BrandDto convert(Brand in);

}