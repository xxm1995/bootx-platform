package cn.bootx.starter.audit.log.core.convert;

import cn.bootx.starter.audit.log.core.entity.LoginLog;
import cn.bootx.starter.audit.log.core.entity.OperateLogger;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import cn.bootx.starter.audit.log.dto.OperateLogDto;
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
