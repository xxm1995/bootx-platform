package cn.bootx.sales.dto.match;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/3
*/
@Data
@Accessors(chain = true)
@ApiModel("匹配关系")
public class MatchRuleDto implements Serializable {
    private static final long serialVersionUID = 4632655262933598313L;

    @ApiModelProperty("主键")
    private Long id;

    @ApiModelProperty("策略注册ID")
    private Long strategyRegisterId;

    @ApiModelProperty("外部关联类型 活动/优惠券")
    private int registerType;

    @ApiModelProperty("特征类型")
    private String featureType;

    @ApiModelProperty("特征值")
    private String featurePoint;

    @ApiModelProperty("匹配类型")
    private String matchType;

}
