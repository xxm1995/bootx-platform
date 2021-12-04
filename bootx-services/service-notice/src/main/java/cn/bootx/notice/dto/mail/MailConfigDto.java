package cn.bootx.notice.dto.mail;

import cn.bootx.common.core.enums.SensitiveType;
import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.starter.data.perm.sensitive.SensitiveInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

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

    @Schema(description= "名称")
    private String name;

    @Schema(description= "编号")
    private String code;

    @Schema(description= "邮箱服务器 地址")
    private String host;

    @Schema(description= "邮箱服务器 端口")
    private Integer port;

    @Schema(description= "邮箱服务器 username")
    private String username;

    @Schema(description= "邮箱服务器 password")
    @SensitiveInfo(SensitiveType.PASSWORD)
    private String password;

    @Schema(description= "邮箱服务器 sender")
    private String sender;

    @Schema(description= "邮箱服务器 from")
    private String from;

    @Schema(description= "是否默认配置")
    private Boolean activity = false;

    /**
     * @see cn.bootx.notice.code.MailCode
     */
    @Schema(description= "安全方式")
    private Integer securityType;
}
