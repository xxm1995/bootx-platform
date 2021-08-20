package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.StrategyRegisterCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.List;

import static cn.bootx.common.core.validation.ValidationGroup.add;
import static cn.bootx.common.core.validation.ValidationGroup.edit;

/**
* @author xxm
* @date 2020/12/4
*/
@Data
@Accessors(chain = true)
@ApiModel("策略注册参数类")
public class StrategyRegisterParam implements Serializable {

    private static final long serialVersionUID = -6901032367671927153L;

    @ApiModelProperty("策略主键")
    @NotNull(groups = {add.class, edit.class})
    private Long strategyId;

    @ApiModelProperty("名称")
    private String name;

    @ApiModelProperty("描述")
    private String description;

    /**
     * @see StrategyRegisterCode
     */
    @ApiModelProperty("策略类型")
    @JsonIgnore
    private Integer strategyType;

    @ApiModelProperty("匹配配置")
    private List<MatchRuleParam> matchRules;

    @ApiModelProperty("选择与使用检查规则")
    private List<CheckRuleParam> checkRules;

    @ApiModelProperty("策略参数值")
    private List<StrategyConfigValueParam> configValues;
}
