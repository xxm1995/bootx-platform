package cn.bootx.sales.dto.order;

import cn.bootx.sales.code.StrategyCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author xxm
 * @date 2020/10/24
 */
@Data
@Accessors(chain = true)
@ApiModel("订单策略映射DTO")
public class OrderStrategyMappingResult implements Serializable {

    private static final long serialVersionUID = -2719923793104400815L;

    @ApiModelProperty("优惠券ID")
    private Long couponId;

    @ApiModelProperty("策略ID")
    private Long strategyId;

    @ApiModelProperty("策略注册ID")
    private Long strategyRegisterId;

    /**
     * @see StrategyCode
     */
    @ApiModelProperty("策略类型")
    private int strategyType;

    @ApiModelProperty("价格变动")
    private BigDecimal priceChange;

    @ApiModelProperty("描述")
    private String description;
}
