package cn.bootx.sales.dto.strategy;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/10/25
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "策略脚本配置项")
public class StrategyConfigDto implements Serializable {

    private static final long serialVersionUID = -3690333270256315691L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("参数key")
    private String key;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("字段类型")
    private String type;

    @ApiModelProperty("描述")
    private String description;

}
