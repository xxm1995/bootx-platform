package cn.bootx.notice.param.mail;

import cn.bootx.notice.code.MailCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.io.Serializable;

;

/**
* @author xxm
* @date 2020/5/2 14:42
*/
@Data
@Schema(title = "邮箱配置 DTO")
public class MailConfigParam implements Serializable {
    private static final long serialVersionUID = 2322690493233843789L;

    @Schema(name = "主键")
    private Long id;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "编号")
    private String code;

    @Schema(name = "邮箱服务器 host")
    private String host;

    @Schema(name = "邮箱服务器 port")
    private Integer port;

    @Schema(name = "邮箱服务器 username")
    private String username;

    @Schema(name = "邮箱服务器 password")
    private String password;

    @Schema(name = "邮箱服务器 sender")
    private String sender;

    @Schema(name = "邮箱服务器 from")
    private String from;

    @Schema(name = "是否默认配置")
    private Boolean activity = false;

    @Schema(name = "安全方式")
    private Integer securityType = MailCode.SECURITY_TYPE_PLAIN;
}
