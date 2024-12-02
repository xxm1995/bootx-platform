package cn.bootx.platform.iam.entity.config;

import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 密码登录失败记录
 * @author xxm
 * @since 2023/8/17
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("iam_password_login_fail_record")
public class PasswordLoginFailRecord extends MpBaseEntity {
}
