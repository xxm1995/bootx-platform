package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.CheckRuleCode;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/5/7
*/
@Data
@Accessors(chain = true)
@Schema(title = "检查规则参数")
public class CheckRuleParam implements Serializable {
    private static final long serialVersionUID = 689686610474750635L;

    @Schema(description= "优先级")
    private int priority;

    @Schema(description= "规则名称")
    private String name;

    @Schema(description= "规则code")
    private String code;

    /**
     * 规则类型
     * @see CheckRuleCode.Activity
     * @see CheckRuleCode.Coupon
     */
    @JsonIgnore
    private int ruleType;

    @Schema(description= "策略id")
    private Long strategyId;

    @Schema(description= "附加对象 json")
    private String addition;
}
