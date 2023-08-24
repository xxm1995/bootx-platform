package cn.bootx.platform.iam.core.security.login.entity;

import cn.bootx.mybatis.table.modify.annotation.DbColumn;
import cn.bootx.mybatis.table.modify.annotation.DbComment;
import cn.bootx.mybatis.table.modify.annotation.DbTable;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 登录安全策略
 * @author xxm
 * @since 2023/8/17
 */
//@DbTable(comment = "登录安全策略")
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_login_security_config")
public class LoginSecurityConfig extends MpBaseEntity {

    /** 关联终端ID */
    @DbComment("关联终端ID")
    private Long clientId;

    /** 最大密码错误数 */
    @DbComment("最大密码错误数")
    private Integer  maxPwdErrorCount;

    /** 密码错误锁定时间(秒) */
    @DbComment("密码错误锁定时间(秒)")
    private Integer errorLockTime;

    /** 强制修改初始密码 */
    private  Boolean  requireChangePwd;

    /** 修改密码是否需要重新登录 */
    @DbComment("修改密码是否需要重新登录")
    private Boolean  requireLoginChangePwd;

    /** 默认启用验证码 */
    @DbComment("默认启用验证码")
    private Boolean captchaEnable;

    /** 出现验证码的错误次数 0 表示不启用 */
    @DbColumn(comment = "出现验证码的错误次数")
    private Integer maxCaptchaErrorCount;

    /** 同端是否允许同时登录 */
    @DbComment("同端是否允许同时登录")
    private  Boolean  allowMultiLogin;

    /** 多终端是否允许同时登录 */
    @DbComment("多终端是否允许同时登录")
    private Boolean  allowMultiTerminalLogin;

}
