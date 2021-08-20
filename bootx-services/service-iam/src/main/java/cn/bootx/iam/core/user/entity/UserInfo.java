package cn.bootx.iam.core.user.entity;


import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.user.convert.UserConvert;
import cn.bootx.iam.dto.user.UserInfoDto;
import cn.bootx.iam.param.user.UserInfoParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
* 用户的基本信息
* @author xxm
* @date 2020/4/24 15:21
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_user_info")
public class UserInfo extends MpBaseEntity implements EntityBaseFunction<UserInfoDto> {

    /** 名称 */
    private String name;

    /** 账号 */
    private String username;

    /** 密码 */
    private String password;

    /** 手机号 */
    private String phone;

    /** 邮箱 */
    private String email;

    /** 注册来源 */
    private String source;

    /** 是否管理员 */
    private boolean admin;

    /** 注册时间 */
    private LocalDateTime registerTime;

    /** 用户类型 1.注册用户 2.游客 */
    private Integer type;

    @Override
    public UserInfoDto toDto() {
        return UserConvert.CONVERT.convert(this);
    }

    public static UserInfo init(UserInfoDto dto) {
        return UserConvert.CONVERT.convert(dto);
    }

    public static UserInfo init(UserInfoParam param) {
        return UserConvert.CONVERT.convert(param);
    }
}
