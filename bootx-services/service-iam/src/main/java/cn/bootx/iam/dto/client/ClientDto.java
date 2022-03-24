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

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 在线时长 分钟 */
    private Long timeout;

    /** 是否启用验证码 */
    private boolean captcha;

    /** 是否系统内置 */
    private boolean system;

    /** 是否可用 */
    private boolean enable;

    /** 描述 */
    private String description;
}
