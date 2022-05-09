package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.StrategyCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

;

/**
* @author xxm
* @date 2020/10/15
*/
@Data
@Accessors(chain = true)
@Schema(title = "策略定义参数")
public class StrategyParam implements Serializable {

    private static final long serialVersionUID = -4666152410169234985L;

    @Schema(description= "策略主键")
    private Long id;

    @Schema(description= "编码")
    private String code;

    @Schema(description= "名称")
    private String name;

    @Schema(description= "描述")
    private String description;

    /**
     * @see StrategyCode TARGET_TYPE_*
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
    private List<StrategyConfigParam> configParams;

}
