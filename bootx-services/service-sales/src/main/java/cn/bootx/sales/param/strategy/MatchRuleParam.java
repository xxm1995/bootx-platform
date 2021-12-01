package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.MatchTypeCode;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/5/19
*/
@Data
@Accessors(chain = true)
@Schema(title = "匹配配置参数")
public class MatchRuleParam implements Serializable {
    private static final long serialVersionUID = -4122307649683307643L;

    @Schema(name = "特征类型")
    private String featureType;

    @Schema(name = "特征值")
    private String featurePoint;

    /**
     * @see MatchTypeCode
     */
    @Schema(name = "匹配类型")
    private String matchType;
}
