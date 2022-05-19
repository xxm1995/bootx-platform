package cn.bootx.starter.auth.entity;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/8/25
*/
@Data
@Accessors(chain = true)
@Schema(title = "认证终端")
public class AuthClient {

    /** 终端id */
    private Long id;

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 在线时长 分钟 */
    private long timeout;

    /** 是否有独立菜单和权限 */
    private boolean alonePrem;

    /** 是否可用 */
    private boolean enable;

    /** 密码错误几次冻结 */
    private int pwdErrNum;

    /** 是否需要验证码 */
    private boolean captcha;
}
