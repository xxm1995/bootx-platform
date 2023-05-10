package cn.bootx.platform.starter.audit.log.param;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 登录日志
 *
 * @author xxm
 * @date 2021/8/12
 */
@Data
@Accessors(chain = true)
@Schema(description = "登录日志")
public class LoginLogParam {

    @Schema(description = "用户账号id")
    private Long userId;

    @Schema(description = "用户名称")
    private String account;

    @Schema(description = "登录成功状态")
    private Boolean login;

    @Schema(description = "登录终端")
    private String client;

    @Schema(description = "登录方式")
    private String loginType;

    @Schema(description = "登录IP地址")
    private String ip;

    @Schema(description = "登录地点")
    private String loginLocation;

    @Schema(description = "浏览器类型")
    private String browser;

    @Schema(description = "操作系统")
    private String os;

    @Schema(description = "提示消息")
    private String msg;

    @Schema(description = "访问时间")
    private LocalDateTime loginTime;

}
