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

    @Schema(name = "策略主键")
    private Long id;

    @Schema(name = "编码")
    private String code;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "描述")
    private String description;

    /**
     * @see StrategyCode
     */
    @Schema(name = "目标类型")
    private int targetType;

    /**
     * @see StrategyCode
     */
    @Schema(name = "引擎类型")
    private int engineType;

    @Schema(name = "策略计算脚本")
    private String ruleScript;

    @Schema(name = "可用状态")
    private Integer state;

    @Schema(name = "配置项")
    private List<StrategyConfigDto> configParams;

    @Schema(name = "是否可更改")
    private boolean updatable = true;

}
