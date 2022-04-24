package cn.bootx.iam.param.client;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 认证终端
* @author xxm  
* @date 2021/8/25 
*/
@Data
@Accessors(chain = true)
@Schema(title = "认证终端")
public class ClientParam {

    @Schema(description= "主键")
    private Long id;

    @Schema(description = "编码")
    private String code;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "是否可用")
    private boolean enable;

    @Schema(description = "是否启用验证码")
    private boolean captcha;

    @Schema(description = "在线时长 分钟")
    private Long timeout;

    @Schema(description = "密码错误几次冻结 -1表示不限制")
    private Integer pwdErrNum;

    @Schema(description = "描述")
    private String description;

}
