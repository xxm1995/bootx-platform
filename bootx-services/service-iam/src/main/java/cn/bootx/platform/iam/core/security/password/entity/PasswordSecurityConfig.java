package cn.bootx.platform.iam.core.security.password.entity;

import cn.bootx.mybatis.table.modify.annotation.DbComment;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 密码安全策略
 * @author xxm
 * @since 2023/8/17
 */
@EqualsAndHashCode(callSuper = true)
@Data
@DbComment("密码安全策略")
@Accessors(chain = true)
@TableName("iam_password_security_config")
public class PasswordSecurityConfig extends MpBaseEntity {

    /** 用户默认密码 */
    private String defaultPassword;

    /** 更新频率 */
    private Integer updateFrequency;

    /** 到期提醒(天数) */
    private Integer expireRemind;

    /** 与登录名相同 */
    private Boolean sameAsLoginName;

    /** 不能与多少次近期密码相同 */
    private  Integer recentPassword;

    /**  */
}
