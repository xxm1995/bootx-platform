package cn.bootx.platform.iam.core.client.entity;

import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.iam.core.client.convert.LoginTypeConvert;
import cn.bootx.platform.iam.param.client.LoginTypeParam;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.iam.dto.client.LoginTypeDto;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 登录方式
 *
 * @author xxm
 * @since 2022/7/5
 */
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("iam_login_type")
@Accessors(chain = true)
public class LonginType extends MpBaseEntity implements EntityBaseFunction<LoginTypeDto> {

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /**
     * password 密码登录, openId 第三方登录
     */
    private String type;

    /** 在线时长 分钟 */
    private Long timeout;

    /** 是否需要验证码 */
    private boolean captcha;

    /** 是否系统内置 */
    @TableField("`system`")
    private boolean system;

    /** 密码错误几次冻结 -1表示不限制 */
    private Integer pwdErrNum;

    /** 是否可用 */
    private boolean enable;

    /** 描述 */
    private String description;

    public static LonginType init(LoginTypeParam in) {
        return LoginTypeConvert.CONVERT.convert(in);
    }

    @Override
    public LoginTypeDto toDto() {
        return LoginTypeConvert.CONVERT.convert(this);
    }

}
