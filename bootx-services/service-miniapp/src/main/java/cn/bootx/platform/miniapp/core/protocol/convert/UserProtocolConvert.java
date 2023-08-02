package cn.bootx.platform.miniapp.core.protocol.convert;

import cn.bootx.platform.miniapp.core.protocol.entity.UserProtocol;
import cn.bootx.platform.miniapp.dto.protocol.UserProtocolDto;
import cn.bootx.platform.miniapp.param.protocol.UserProtocolParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 用户协议
 * @author xxm
 * @since 2023-08-02
 */
@Mapper
public interface UserProtocolConvert {
    UserProtocolConvert CONVERT = Mappers.getMapper(UserProtocolConvert.class);

    UserProtocol convert(UserProtocolParam in);

    UserProtocolDto convert(UserProtocol in);

}
