package cn.bootx.baseapi.core.app.convert;

import cn.bootx.baseapi.core.app.entity.AppVersion;
import cn.bootx.baseapi.dto.app.AppVersionDto;
import cn.bootx.baseapi.param.app.AppVersionParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 转换
* @author xxm  
* @date 2021/8/9 
*/
@Mapper
public interface AppVersionConvert {
    AppVersionConvert CONVERT = Mappers.getMapper(AppVersionConvert.class);

    @Mappings({})
    AppVersion convert(AppVersionParam in);

    @Mappings({})
    AppVersion convert(AppVersionDto in);

    @Mappings({})
    AppVersionDto convert(AppVersion in);
}
