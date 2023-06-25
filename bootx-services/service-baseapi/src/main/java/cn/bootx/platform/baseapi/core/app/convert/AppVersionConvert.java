package cn.bootx.platform.baseapi.core.app.convert;

import cn.bootx.platform.baseapi.core.app.entity.AppVersion;
import cn.bootx.platform.baseapi.dto.app.AppVersionDto;
import cn.bootx.platform.baseapi.param.app.AppVersionParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 转换
 *
 * @author xxm
 * @since 2021/8/9
 */
@Mapper
public interface AppVersionConvert {

    AppVersionConvert CONVERT = Mappers.getMapper(AppVersionConvert.class);

    AppVersion convert(AppVersionParam in);

    AppVersion convert(AppVersionDto in);

    AppVersionDto convert(AppVersion in);

}
