package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.StrategyCode;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2020/10/15
*/
@Data
@Accessors(chain = true)
@Schema(title = "策略定义参数")
public class StrategyParam implements Serializable {

    private static final long serialVersionUID = -4666152410169234985L;

    @Schema(name = "策略主键")
    private Long id;

    @Schema(name = "编码")
    private String code;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "描述")
    private String description;

    /**
     * @see StrategyCode TARGET_TYPE_*
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
    private List<StrategyConfigParam> configParams;

}
