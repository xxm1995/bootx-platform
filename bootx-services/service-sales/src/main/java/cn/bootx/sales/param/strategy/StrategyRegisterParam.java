package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.StrategyRegisterCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "策略注册参数类")
public class StrategyRegisterParam implements Serializable {

    private static final long serialVersionUID = -6901032367671927153L;

    @Schema(name = "策略主键")
    @NotNull(groups = {add.class, edit.class})
    private Long strategyId;

    @Schema(name = "名称")
    private String name;

    @Schema(name = "描述")
    private String description;

    /**
     * @see StrategyRegisterCode
     */
    @Schema(name = "策略类型")
    @JsonIgnore
    private Integer strategyType;

    @Schema(name = "匹配配置")
    private List<MatchRuleParam> matchRules;

    @Schema(name = "选择与使用检查规则")
    private List<CheckRuleParam> checkRules;

    @Schema(name = "策略参数值")
    private List<StrategyConfigValueParam> configValues;
}
