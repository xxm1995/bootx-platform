package cn.bootx.iam.core.social.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.social.convert.UserSocialInfoConvert;
import cn.bootx.iam.dto.user.UserSocialInfoDto;
import cn.bootx.iam.param.user.UserSocialInfoParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 用户三方登录绑定详情
* @author xxm
* @date 2022-07-02
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_user_social_info")
@Accessors(chain = true)
public class UserSocialInfo extends MpBaseEntity implements EntityBaseFunction<UserSocialInfoDto>{

    /** 用户id */
    private Long userId;
    /** 第三方终端类型 */
    private String clientCode;
    /** 用户名 */
    private String username;
    /** 用户昵称 */
    private String nickname;
    /** 用户头像 */
    private String avatar;

    /** 创建对象 */
    public static UserSocialInfo init(UserSocialInfoParam in) {
            return UserSocialInfoConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public UserSocialInfoDto toDto() {
        return UserSocialInfoConvert.CONVERT.convert(this);
    }
}
