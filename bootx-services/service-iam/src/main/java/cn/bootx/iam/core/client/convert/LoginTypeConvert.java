package cn.bootx.iam.core.client.convert;

import cn.bootx.iam.core.client.entity.LonginType;
import cn.bootx.iam.dto.client.LoginTypeDto;
import cn.bootx.iam.param.client.LoginTypeParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 认证终端
 * @author bootx
 * @date 2022-02-20
 */
@Mapper
public interface LoginTypeConvert {
    LoginTypeConvert CONVERT = Mappers.getMapper(LoginTypeConvert.class);

    LonginType convert(LoginTypeParam in);

    LoginTypeDto convert(LonginType in);

}