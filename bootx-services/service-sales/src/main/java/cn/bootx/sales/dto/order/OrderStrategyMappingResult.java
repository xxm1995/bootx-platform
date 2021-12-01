package cn.bootx.sales.dto.order;

import cn.bootx.sales.code.StrategyCode;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "订单策略映射DTO")
public class OrderStrategyMappingResult implements Serializable {

    private static final long serialVersionUID = -2719923793104400815L;

    @Schema(description= "优惠券ID")
    private Long couponId;

    @Schema(description= "策略ID")
    private Long strategyId;

    @Schema(description= "策略注册ID")
    private Long strategyRegisterId;

    /**
     * @see StrategyCode
     */
    @Schema(description= "策略类型")
    private int strategyType;

    @Schema(description= "价格变动")
    private BigDecimal priceChange;

    @Schema(description= "描述")
    private String description;
}
