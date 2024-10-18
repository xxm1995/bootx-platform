package cn.bootx.platform.baseapi.convert.chinaword;

import cn.bootx.platform.baseapi.entity.chinaword.ChinaWord;
import cn.bootx.platform.baseapi.param.chinaword.ChinaWordParam;
import cn.bootx.platform.baseapi.result.chinaword.ChinaWordResult;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 敏感词
 * @author xxm
 * @since 2023-08-09
 */
@Mapper
public interface ChinaWordConvert {
    ChinaWordConvert CONVERT = Mappers.getMapper(ChinaWordConvert.class);

    ChinaWord convert(ChinaWordParam in);

    ChinaWordResult convert(ChinaWord in);

}
