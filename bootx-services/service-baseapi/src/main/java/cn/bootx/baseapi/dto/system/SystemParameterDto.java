package cn.bootx.baseapi.dto.system;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 系统参数
* @author xxm
* @date 2021/10/25
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "系统参数")
public class SystemParameterDto extends BaseDto {

    @Schema(description= "参数名称")
    private String name;

    @Schema(description= "参数键名")
    private String paramKey;

    @Schema(description= "参数值")
    private String value;

    @Schema(description= "参数类型")
    private Integer type;

    @Schema(description= "是否系统参数")
    private boolean system;

    @Schema(description= "备注")
    private String mark;
}
