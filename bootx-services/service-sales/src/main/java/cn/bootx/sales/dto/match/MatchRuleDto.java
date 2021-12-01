package cn.bootx.sales.dto.match;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/3
*/
@Data
@Accessors(chain = true)
@Schema(title = "匹配关系")
public class MatchRuleDto implements Serializable {
    private static final long serialVersionUID = 4632655262933598313L;

    @Schema(description= "主键")
    private Long id;

    @Schema(description= "策略注册ID")
    private Long strategyRegisterId;

    @Schema(description= "外部关联类型 活动/优惠券")
    private int registerType;

    @Schema(description= "特征类型")
    private String featureType;

    @Schema(description= "特征值")
    private String featurePoint;

    @Schema(description= "匹配类型")
    private String matchType;

}
