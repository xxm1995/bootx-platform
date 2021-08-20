package cn.bootx.sales.dto.check;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/1
*/
@Data
@Accessors(chain = true)
@ApiModel("优惠券检查规则")
public class CheckRuleDto implements Serializable {
    private static final long serialVersionUID = 664176956159699317L;

    private Long id;

    @ApiModelProperty("策略注册ID")
    private Long registerId;

    @ApiModelProperty("关联策略注册类型 活动/优惠券")
    private int registerType;

    @ApiModelProperty("优先级")
    private int priority;

    @ApiModelProperty("规则名称")
    private String name;

    @ApiModelProperty("规则code")
    private String code;

    @ApiModelProperty("类型(引擎)")
    private int engineType;

    @ApiModelProperty("策略id")
    private Long strategyId;

    @ApiModelProperty("策略脚本")
    private String ruleScript;

    @ApiModelProperty("附加对象 json")
    private String addition;

}
