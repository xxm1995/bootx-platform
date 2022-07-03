package cn.bootx.iam.core.user.convert;

import cn.bootx.iam.core.social.entity.UserSocial;
import cn.bootx.iam.core.user.entity.UserExpandInfo;
import cn.bootx.iam.core.user.entity.UserInfo;
import cn.bootx.iam.dto.user.UserExpandInfoDto;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.dto.user.UserSocialDto;
import cn.bootx.iam.param.user.UserInfoParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserConvert {
    UserConvert CONVERT = Mappers.getMapper(UserConvert.class);

    UserInfo convert(UserInfoParam in);

    UserInfoDto convert(UserInfo in);

    UserSocialDto convert(UserSocial in);

    UserExpandInfoDto convert(UserExpandInfo in);

}
