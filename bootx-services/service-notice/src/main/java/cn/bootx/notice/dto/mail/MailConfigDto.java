package cn.bootx.notice.dto.mail;

import cn.bootx.common.core.enums.SensitiveType;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.common.jackson.sensitive.SensitiveInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

;

/**
* @author xxm
* @date 2020/5/2 14:42
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "邮箱配置")
@Accessors(chain = true)
public class MailConfigDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 2322690493233843789L;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "编号")
    private String code;

    @Schema(name = "邮箱服务器 地址")
    private String host;

    @Schema(name = "邮箱服务器 端口")
    private Integer port;

    @Schema(name = "邮箱服务器 username")
    private String username;

    @Schema(name = "邮箱服务器 password")
    @SensitiveInfo(SensitiveType.PASSWORD)
    private String password;

    @Schema(name = "邮箱服务器 sender")
    private String sender;

    @Schema(name = "邮箱服务器 from")
    private String from;

    @Schema(name = "是否默认配置")
    private Boolean activity = false;

    /**
     * @see cn.bootx.notice.code.MailCode
     */
    @Schema(name = "安全方式")
    private Integer securityType;
}
