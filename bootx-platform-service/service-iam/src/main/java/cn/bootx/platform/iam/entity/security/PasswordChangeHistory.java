package cn.bootx.platform.iam.entity.security;

import cn.bootx.platform.common.mybatisplus.base.MpCreateEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 密码更改历史
 * @author xxm
 * @since 2023/8/17
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
public class PasswordChangeHistory extends MpCreateEntity {

    /** 用户Id */
    private Long userId;

    /** 密码 */
    private String password;
}
