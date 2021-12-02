package cn.bootx.starter.audit.log.core.db.convert;

import cn.bootx.starter.audit.log.core.db.entity.LoginLogDb;
import cn.bootx.starter.audit.log.core.db.entity.OperateLogDb;
import cn.bootx.starter.audit.log.dto.LoginLogDto;
import cn.bootx.starter.audit.log.dto.OperateLogDto;
import cn.bootx.starter.audit.log.param.LoginLogParam;
import cn.bootx.starter.audit.log.param.OperateLogParam;
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
    OperateLogDto convert(OperateLogDb in);

    @Mappings({})
    LoginLogDto convert(LoginLogDb in);

    @Mappings({})
    OperateLogDb convert(OperateLogParam in);

    @Mappings({})
    LoginLogDb convert(LoginLogParam in);
}
