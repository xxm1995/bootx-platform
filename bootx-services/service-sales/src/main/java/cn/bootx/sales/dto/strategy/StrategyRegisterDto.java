package cn.bootx.sales.dto.strategy;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.sales.dto.check.CheckRuleDto;
import cn.bootx.sales.dto.match.MatchRuleDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**   
* 策略注册
* @author xxm  
* @date 2020/10/15 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "策略注册")
public class StrategyRegisterDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = -7198577385245322049L;

    @Schema(description= "策略主键")
    private Long strategyId;

    @Schema(description= "名称")
    private String name;

    @Schema(description= "描述")
    private String description;

    @Schema(description= "检测规则")
    private List<CheckRuleDto> checkRules;

   @Schema(description= "匹配内容规则")
    private List<MatchRuleDto> matchRules;

    @Schema(description= "策略脚本配置项值")
    private List<StrategyConfigValueDto> configValues;
}
