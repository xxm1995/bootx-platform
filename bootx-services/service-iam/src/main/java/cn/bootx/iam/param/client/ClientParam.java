package cn.bootx.iam.param.client;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 是否可用 */
    private boolean enable;

    /** 是否启用验证码 */
    private boolean captcha;

    /** 在线时长 分钟 */
    private Long timeout;

    /** 描述 */
    private String description;

}
