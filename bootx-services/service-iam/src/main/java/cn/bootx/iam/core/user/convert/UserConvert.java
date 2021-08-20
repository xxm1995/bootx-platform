package cn.bootx.iam.core.user.convert;

import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.core.user.entity.UserSocialLogin;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.dto.user.UserSocialLoginDto;
import cn.bootx.iam.param.user.UserInfoParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserConvert {
    UserConvert CONVERT = Mappers.getMapper(UserConvert.class);

    @Mappings({})
    UserInfo convert(UserInfoParam in);

    @Mappings({})
    UserInfo convert(UserInfoDto in);

    @Mappings({})
    UserInfoDto convert(UserInfo in);

    @Mappings({})
    UserSocialLoginDto convert(UserSocialLogin in);
}
