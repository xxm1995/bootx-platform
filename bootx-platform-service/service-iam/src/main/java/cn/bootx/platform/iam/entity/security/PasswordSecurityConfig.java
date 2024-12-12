package cn.bootx.platform.iam.entity.security;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.common.mybatisplus.function.ToResult;
import cn.bootx.platform.iam.convert.security.PasswordSecurityConfigConvert;
import cn.bootx.platform.iam.param.security.PasswordSecurityConfigParam;
import cn.bootx.platform.iam.result.security.PasswordSecurityConfigResult;
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
@Accessors(chain = true)
@TableName("iam_password_security_config")
public class PasswordSecurityConfig extends MpBaseEntity implements ToResult<PasswordSecurityConfigResult> {

    /** 最大密码错误数 */
    private int  maxPwdErrorCount;

    /** 密码错误锁定时间(分钟) */
    private int errorLockTime;

    /** 强制修改初始密码 */
    private  boolean  requireChangePwd;

    /** 更新频率(天数) */
    private int updateFrequency;

    /** 到期提醒(天数) */
    private int expireRemind;

    /** 与登录名相同 */
    private boolean sameAsLoginName;

    /** 不能与近期多少次密码相同 */
    private int recentPassword;

    public static PasswordSecurityConfig init(PasswordSecurityConfigParam param){
        return PasswordSecurityConfigConvert.CONVERT.toEntity(param);
    }

    /**
     * 转换
     */
    @Override
    public PasswordSecurityConfigResult toResult() {
        return PasswordSecurityConfigConvert.CONVERT.toResult(this);
    }
}
