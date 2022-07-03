package cn.bootx.iam.core.social.convert;

import cn.bootx.iam.core.social.entity.UserSocial;
import cn.bootx.iam.dto.user.UserSocialDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserSocialConvert {
    UserSocialConvert CONVERT = Mappers.getMapper(UserSocialConvert.class);

    UserSocialDto convert(UserSocial in);
}
