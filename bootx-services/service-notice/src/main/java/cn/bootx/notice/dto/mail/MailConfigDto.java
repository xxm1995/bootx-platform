package cn.bootx.notice.dto.mail;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "邮箱配置")
@Accessors(chain = true)
public class MailConfigDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 2322690493233843789L;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty(name = "code", value = "编号")
    private String code;

    @ApiModelProperty(name = "host", value = "邮箱服务器 host")
    private String host;

    @ApiModelProperty(name = "port", value = "邮箱服务器 port")
    private Integer port;

    @ApiModelProperty(name = "username", value = "邮箱服务器 username")
    private String username;

    @ApiModelProperty(name = "password", value = "邮箱服务器 password")
    private String password;

    @ApiModelProperty(name = "sender", value = "邮箱服务器 sender")
    private String sender;

    @ApiModelProperty(name = "from", value = "邮箱服务器 from")
    private String from;

    @ApiModelProperty(name = "activity", value = "是否默认配置")
    private Boolean activity = false;

    @ApiModelProperty(value = "安全方式")
    private Integer securityType;
}
