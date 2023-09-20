package cn.bootx.platform.iam.core.security.password.entity;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.table.modify.annotation.DbComment;
import com.baomidou.mybatisplus.annotation.TableName;
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
//@DbTable(comment =  "密码更改历史")
@Accessors(chain = true)
@TableName("iam_password_change_history")
public class PasswordChangeHistory extends MpBaseEntity {
    /** 用户Id */
    @DbComment("用户Id")
    private Long userId;

    /** 密码 */
    @DbComment("密码")
    private String password;
}
