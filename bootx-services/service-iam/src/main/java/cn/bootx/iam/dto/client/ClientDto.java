package cn.bootx.iam.dto.client;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**   
* 认证终端
* @author xxm  
* @date 2021/8/25 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "认证终端")
public class ClientDto extends BaseDto {

    @Schema(description = "编码")
    private String code;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "在线时长 分钟")
    private Long timeout;

    @Schema(description = "是否有独立菜单和权限")
    private boolean alonePrem;

    @Schema(description = "是否启用验证码")
    private boolean captcha;

    @Schema(description = "密码错误几次冻结 -1表示不限制")
    private Integer pwdErrNum;

    @Schema(description = "是否系统内置")
    private boolean system;

    @Schema(description = "是否可用")
    private boolean enable;

    @Schema(description = "描述")
    private String description;
}
