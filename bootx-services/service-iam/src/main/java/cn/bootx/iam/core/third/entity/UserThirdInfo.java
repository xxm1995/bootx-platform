package cn.bootx.iam.core.third.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.third.convert.UserThirdInfoConvert;
import cn.bootx.iam.dto.user.UserThirdInfoDto;
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
@TableName("iam_user_third_info")
@Accessors(chain = true)
public class UserThirdInfo extends MpBaseEntity implements EntityBaseFunction<UserThirdInfoDto>{

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

    /** 转换成dto */
    @Override
    public UserThirdInfoDto toDto() {
        return UserThirdInfoConvert.CONVERT.convert(this);
    }
}
