package cn.bootx.sales.dto.strategy;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.sales.code.StrategyCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2020/10/15
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "策略")
public class StrategyDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 6586989712139176276L;

    @Schema(description= "策略主键")
    private Long id;

    @Schema(description= "编码")
    private String code;

    @Schema(description= "名称")
    private String name;

    @Schema(description= "描述")
    private String description;

    /**
     * @see StrategyCode
     */
    @Schema(description= "目标类型")
    private int targetType;

    /**
     * @see StrategyCode
     */
    @Schema(description= "引擎类型")
    private int engineType;

    @Schema(description= "策略计算脚本")
    private String ruleScript;

    @Schema(description= "可用状态")
    private Integer state;

    @Schema(description= "配置项")
    private List<StrategyConfigDto> configParams;

    @Schema(description= "是否可更改")
    private boolean updatable = true;

}
