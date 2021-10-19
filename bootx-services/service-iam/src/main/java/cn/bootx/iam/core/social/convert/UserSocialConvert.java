package cn.bootx.iam.core.social.convert;

import cn.bootx.iam.core.social.entity.UserSocialLogin;
import cn.bootx.iam.dto.user.UserSocialLoginDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserSocialConvert {
    UserSocialConvert CONVERT = Mappers.getMapper(UserSocialConvert.class);

    @Mappings({})
    UserSocialLoginDto convert(UserSocialLogin in);
}
