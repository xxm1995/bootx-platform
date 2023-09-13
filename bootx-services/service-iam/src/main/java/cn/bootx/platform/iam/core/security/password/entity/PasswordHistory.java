package cn.bootx.platform.iam.core.security.password.entity;

import cn.bootx.table.modify.annotation.DbComment;
import cn.bootx.table.modify.annotation.DbTable;
import cn.bootx.platform.common.mybatisplus.base.MpCreateEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 密码历史
 * @author xxm
 * @since 2023/8/17
 */
@EqualsAndHashCode(callSuper = true)
@Data
//@DbTable(comment =  "密码历史")
@Accessors(chain = true)
@TableName("iam_password_history")
public class PasswordHistory extends MpCreateEntity {
    /** 用户Id */
    @DbComment("用户Id")
    private Long userId;

    /** 密码 */
    @DbComment("密码")
    private String password;

}
