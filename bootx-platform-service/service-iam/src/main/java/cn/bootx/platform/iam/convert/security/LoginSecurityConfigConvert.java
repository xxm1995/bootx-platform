package cn.bootx.platform.iam.convert.security;

import cn.bootx.platform.iam.entity.security.LoginSecurityConfig;
import cn.bootx.platform.iam.param.security.LoginSecurityConfigParam;
import cn.bootx.platform.iam.result.security.LoginSecurityConfigResult;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 登录安全策略
 * @author xxm
 * @since 2023-09-19
 */
@Mapper
public interface LoginSecurityConfigConvert {
    LoginSecurityConfigConvert CONVERT = Mappers.getMapper(LoginSecurityConfigConvert.class);

    LoginSecurityConfig convert(LoginSecurityConfigParam in);

    LoginSecurityConfigResult convert(LoginSecurityConfig in);
}
