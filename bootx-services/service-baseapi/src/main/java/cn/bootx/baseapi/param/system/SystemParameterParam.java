package cn.bootx.baseapi.param.system;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 系统参数
* @author xxm  
* @date 2021/10/25 
*/
@Data
@Accessors(chain = true)
@ApiModel("系统参数")
public class SystemParameterParam {
    @ApiModelProperty("系统参数")
    private Long id;

    /** 参数名称 */
    private String name;

    /** 参数键名 */
    private String paramKey;

    /** 参数值 */
    private String value;

    /** 参数类型 */
    private Integer type;

    /** 系统参数 */
    private boolean system;

    /** 备注 */
    private String mark;
}
