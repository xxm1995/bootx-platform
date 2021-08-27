package cn.bootx.iam.param.client;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 认证终端
* @author xxm  
* @date 2021/8/25 
*/
@Data
@Accessors(chain = true)
@ApiModel("认证终端")
public class ClientParam {

    @ApiModelProperty("主键")
    private Long id;

    /** 编码 */
    private String code;

    /** 名称 */
    private String name;

    /** 在线时长 分钟 */
    private Long timeout;

    /** 描述 */
    private String description;

    /** 是否可用 */
    private boolean enable;
}
