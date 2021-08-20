package cn.bootx.goods.core.sku.convert;

import cn.bootx.goods.core.sku.entity.GoodsSku;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import cn.bootx.goods.param.sku.SkuParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 转换
* @author xxm  
* @date 2021/7/23 
*/
@Mapper
public interface SkuConvert {
    SkuConvert CONVERT = Mappers.getMapper(SkuConvert.class);

    @Mappings({})
    GoodsSku convert(SkuParam in);

    @Mappings({})
    GoodsSku convert(GoodsSkuDto in);

    @Mappings({})
    GoodsSkuDto convert(GoodsSku in);
}
