package cn.bootx.baseapi.core.log.convert;

import cn.bootx.baseapi.core.log.entity.LoginLog;
import cn.bootx.baseapi.core.log.entity.OperateLogger;
import cn.bootx.baseapi.dto.log.LoginLogDto;
import cn.bootx.baseapi.dto.log.OperateLogDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 日志转换
* @author xxm
* @date 2021/8/12
*/
@Mapper
public interface LogConvert {
    LogConvert CONVERT = Mappers.getMapper(LogConvert.class);

    @Mappings({})
    OperateLogDto convert(OperateLogger operateLogger);

    @Mappings({})
    LoginLogDto convert(LoginLog logLog);
}
