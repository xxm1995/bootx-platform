package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.CheckRuleCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/5/7
*/
@Data
@Accessors(chain = true)
@ApiModel("检查规则参数")
public class CheckRuleParam implements Serializable {
    private static final long serialVersionUID = 689686610474750635L;

    @ApiModelProperty("优先级")
    private int priority;

    @ApiModelProperty("规则名称")
    private String name;

    @ApiModelProperty("规则code")
    private String code;

    /**
     * 规则类型
     * @see CheckRuleCode.Activity
     * @see CheckRuleCode.Coupon
     */
    @JsonIgnore
    private int ruleType;

    @ApiModelProperty("策略id")
    private Long strategyId;

    @ApiModelProperty("附加对象 json")
    private String addition;
}
