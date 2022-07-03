package cn.bootx.iam.core.social.convert;

import cn.bootx.iam.core.social.entity.UserSocialInfo;
import cn.bootx.iam.dto.user.UserSocialInfoDto;
import cn.bootx.iam.param.user.UserSocialInfoParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 用户三方登录绑定详情
 * @author xxm
 * @date 2022-07-02
 */
@Mapper
public interface UserSocialInfoConvert {
    UserSocialInfoConvert CONVERT = Mappers.getMapper(UserSocialInfoConvert.class);

    UserSocialInfo convert(UserSocialInfoParam in);

    UserSocialInfoDto convert(UserSocialInfo in);

}