package cn.bootx.iam.dto.auth;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @author xxm
 * @date 2021/6/3
 */
@Data
@Accessors(chain = true)
@Schema(title = "认证返回消息")
public class AuthInfoResult {

    /** 用户id */
    private Long uid;

    /** 租户 */
    private Long tid;

    /** 名称 */
    private String name;

    /** 账号 */
    private String username;

    /** 邮件 */
    private String email;

    /** 手机号 */
    private String phone;

    /** 是否超级管理员 */
    private boolean admin;

    /** 登录时间 */
    private LocalDateTime loginTime;

    /** 终端 */
    private String client;

    /** token */
    private String token;

}
