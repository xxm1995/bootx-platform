package cn.bootx.iam.param.user;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;

/**   
* 用户绑定第三方开放平台参数
* @author xxm  
* @date 2022/7/2 
*/
@Data
@Accessors(chain = true)
@Schema(title = "用户绑定第三方开放平台参数")
public class UserBindSocialParam {

    @NotBlank(message = "授权码不可为空")
    @Schema(description = "")
    private String authCode;

    @NotBlank(message = "终端类型不可为空")
    @Schema(description = "")
    private String clientCode;

    @NotBlank(message = "state不可为空")
    @Schema(description = "state")
    private String state;
}
