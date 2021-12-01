package cn.bootx.sales.param.strategy;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/10/25
*/
@Data
@Accessors(chain = true)
@Schema(title = "策略脚本配置项")
public class StrategyConfigParam implements Serializable {
    private static final long serialVersionUID = -3690333270256315691L;

    @Schema(description= "主键ID")
    private Long id;

    @Schema(description= "参数key")
    private String key;

    @Schema(description= "名称")
    private String name;

    @Schema(description= "字段类型")
    private String type;

    @Schema(description= "描述")
    private String description;
}
