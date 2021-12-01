package cn.bootx.sales.dto.check;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/1
*/
@Data
@Accessors(chain = true)
@Schema(title = "优惠券检查规则")
public class CheckRuleDto implements Serializable {
    private static final long serialVersionUID = 664176956159699317L;

    private Long id;

    @Schema(name = "策略注册ID")
    private Long registerId;

    @Schema(name = "关联策略注册类型 活动/优惠券")
    private int registerType;

    @Schema(name = "优先级")
    private int priority;

    @Schema(name = "规则名称")
    private String name;

    @Schema(name = "规则code")
    private String code;

    @Schema(name = "类型(引擎)")
    private int engineType;

    @Schema(name = "策略id")
    private Long strategyId;

    @Schema(name = "策略脚本")
    private String ruleScript;

    @Schema(name = "附加对象 json")
    private String addition;

}
