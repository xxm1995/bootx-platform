package cn.bootx.sales.param.strategy;

import cn.bootx.sales.code.MatchTypeCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/5/19
*/
@Data
@Accessors(chain = true)
@ApiModel("匹配配置参数")
public class MatchRuleParam implements Serializable {
    private static final long serialVersionUID = -4122307649683307643L;

    @ApiModelProperty("特征类型")
    private String featureType;

    @ApiModelProperty("特征值")
    private String featurePoint;

    /**
     * @see MatchTypeCode
     */
    @ApiModelProperty("匹配类型")
    private String matchType;
}
