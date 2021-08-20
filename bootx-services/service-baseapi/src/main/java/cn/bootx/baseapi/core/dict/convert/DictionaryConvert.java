package cn.bootx.baseapi.core.dict.convert;

import cn.bootx.baseapi.core.dict.entity.Dictionary;
import cn.bootx.baseapi.core.dict.entity.DictionaryItem;
import cn.bootx.baseapi.dto.dict.DictionaryDto;
import cn.bootx.baseapi.dto.dict.DictionaryItemDto;
import cn.bootx.baseapi.param.dict.DictionaryItemParam;
import cn.bootx.baseapi.param.dict.DictionaryParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 渠道转换
* @author xxm  
* @date 2021/7/6 
*/
@Mapper
public interface DictionaryConvert {
    DictionaryConvert CONVERT = Mappers.getMapper(DictionaryConvert.class);

    @Mappings({})
    Dictionary convert(DictionaryDto in);

    @Mappings({})
    Dictionary convert(DictionaryParam in);

    @Mappings({})
    DictionaryDto convert(Dictionary in);

    @Mappings({})
    DictionaryItem convert(DictionaryItemDto in);

    @Mappings({})
    DictionaryItem convert(DictionaryItemParam in);

    @Mappings({})
    DictionaryItemDto convert(DictionaryItem in);

}
