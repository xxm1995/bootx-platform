package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.StrategyCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel(value = "策略定义参数")
public class StrategyParam implements Serializable {

    private static final long serialVersionUID = -4666152410169234985L;

    @ApiModelProperty("策略主键")
    private Long id;

    @ApiModelProperty("编码")
    private String code;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("描述")
    private String description;

    /**
     * @see StrategyCode TARGET_TYPE_*
     */
    @ApiModelProperty("目标类型")
    private int targetType;

    /**
     * @see StrategyCode
     */
    @ApiModelProperty("引擎类型")
    private int engineType;

    @ApiModelProperty("策略计算脚本")
    private String ruleScript;

    @ApiModelProperty("可用状态")
    private Integer state;

    @ApiModelProperty("配置项")
    private List<StrategyConfigParam> configParams;

}
