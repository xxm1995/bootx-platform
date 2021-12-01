package cn.bootx.order.dto.order;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**   
*
* @author xxm  
* @date 2021/3/10 
*/
@Data
@Accessors(chain = true)
@Schema(title = "应用策略后价格变动记录")
public class OrderStrategyMappingDto implements Serializable {
    private static final long serialVersionUID = 5845910774643018583L;

    @Schema(name = "主键ID")
    private Long id;

    @Schema(name = "订单id")
    private Long orderId;

    @Schema(name = "明细id")
    private Long orderDetailId;

    @Schema(name = "优惠券ID")
    private Long couponId;

    @Schema(name = "策略ID")
    private Long strategyId;

    @Schema(name = "策略注册ID")
    private Long strategyRegisterId;

    @Schema(name = "价格变动")
    private BigDecimal priceChange;

    @Schema(name = "描述")
    private String desc;
}
