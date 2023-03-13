package cn.bootx.iam.core.user.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.iam.core.user.convert.UserConvert;
import cn.bootx.iam.dto.user.UserExpandInfoDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * 用户扩展信息
 *
 * @author xxm
 * @date 2022/1/8
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_user_expand_info")
public class UserExpandInfo extends MpBaseEntity implements EntityBaseFunction<UserExpandInfoDto> {

    /** 性别 */
    private Integer sex;

    /** 头像 */
    private String avatar;

    /** 生日 */
    private LocalDate birthday;

    /** 上次登录时间 */
    private LocalDateTime lastLoginTime;

    /** 本次登录时间 */
    private LocalDateTime currentLoginTime;

    /** 是否初始密码 */
    private boolean initialPassword;

    /** 上次修改密码时间 */
    private LocalDateTime lastChangePasswordTime;

    @Override
    public UserExpandInfoDto toDto() {
        return UserConvert.CONVERT.convert(this);
    }

}
