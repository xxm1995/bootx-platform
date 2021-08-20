package cn.bootx.order.dto.order;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("应用策略后价格变动记录")
public class OrderStrategyMappingDto implements Serializable {
    private static final long serialVersionUID = 5845910774643018583L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("订单id")
    private Long orderId;

    @ApiModelProperty("明细id")
    private Long orderDetailId;

    @ApiModelProperty("优惠券ID")
    private Long couponId;

    @ApiModelProperty("策略ID")
    private Long strategyId;

    @ApiModelProperty("策略注册ID")
    private Long strategyRegisterId;

    @ApiModelProperty("价格变动")
    private BigDecimal priceChange;

    @ApiModelProperty("描述")
    private String desc;
}
