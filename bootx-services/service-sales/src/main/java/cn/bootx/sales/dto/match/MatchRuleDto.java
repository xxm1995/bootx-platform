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

    @Schema(name = "主键")
    private Long id;

    @Schema(name = "策略注册ID")
    private Long strategyRegisterId;

    @Schema(name = "外部关联类型 活动/优惠券")
    private int registerType;

    @Schema(name = "特征类型")
    private String featureType;

    @Schema(name = "特征值")
    private String featurePoint;

    @Schema(name = "匹配类型")
    private String matchType;

}
