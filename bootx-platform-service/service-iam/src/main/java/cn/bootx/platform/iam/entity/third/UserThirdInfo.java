package cn.bootx.platform.iam.entity.third;

import cn.bootx.platform.common.mybatisplus.base.MpRealDelEntity;
import cn.bootx.platform.common.mybatisplus.function.ToResult;
import cn.bootx.platform.iam.convert.third.UserThirdInfoConvert;
import cn.bootx.platform.iam.result.third.UserThirdInfoDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 用户三方登录绑定详情
 *
 * @author xxm
 * @since 2022-07-02
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_user_third_info")
@Accessors(chain = true)
public class UserThirdInfo extends MpRealDelEntity implements ToResult<UserThirdInfoDto> {

    /** 用户id */
    private Long userId;

    /** 第三方终端类型 */
    private String clientCode;

    /** 三方平台用户名 */
    private String username;

    /** 三方平台用户昵称 */
    private String nickname;

    /** 三方平台用户头像 */
    private String avatar;

    /** 关联第三方平台中的用户id(例如钉钉) */
    private String thirdUserId;

    /** 转换成dto */
    @Override
    public UserThirdInfoDto toResult() {
        return UserThirdInfoConvert.CONVERT.convert(this);
    }

}
