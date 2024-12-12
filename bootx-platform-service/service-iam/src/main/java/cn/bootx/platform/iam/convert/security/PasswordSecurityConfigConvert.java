package cn.bootx.platform.iam.convert.security;

import cn.bootx.platform.iam.entity.security.PasswordSecurityConfig;
import cn.bootx.platform.iam.param.security.PasswordSecurityConfigParam;
import cn.bootx.platform.iam.result.security.PasswordSecurityConfigResult;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 密码安全策略
 * @author xxm
 * @since 2023-09-20
 */
@Mapper
public interface PasswordSecurityConfigConvert {
    PasswordSecurityConfigConvert CONVERT = Mappers.getMapper(PasswordSecurityConfigConvert.class);

    PasswordSecurityConfig toEntity(PasswordSecurityConfigParam in);

    PasswordSecurityConfigResult toResult(PasswordSecurityConfig in);
}
