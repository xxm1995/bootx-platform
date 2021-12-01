package cn.bootx.baseapi.param.system;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

;

/**   
* 系统参数
* @author xxm  
* @date 2021/10/25 
*/
@Data
@Accessors(chain = true)
@Schema(title = "系统参数")
public class SystemParameterParam {

    @Schema(description= "系统参数")
    private Long id;

    @Schema(description= "参数名称")
    private String name;

    @Schema(description = "参数键名")
    private String paramKey;

    @Schema(description = "参数值")
    private String value;

    @Schema(description = "参数键名")
    private Integer type;

    @Schema(description = "是否是系统参数")
    private boolean system;

    @Schema(description = "备注")
    private String mark;
}
