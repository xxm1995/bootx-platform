package cn.bootx.order.dto.returm;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**   
*
* @author xxm  
* @date 2020/11/19 
*/
@Data
@Accessors(chain = true)
@ApiModel("退货单明细dto")
public class ReturnOrderDetailDto implements Serializable {

    private static final long serialVersionUID = 3467727603218965746L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("订单ID")
    private Long orderId;

    @ApiModelProperty("skuId")
    private Long skuId;

    @ApiModelProperty("支付金额")
    private BigDecimal payAmount;

    @ApiModelProperty("原订单明细ID")
    private Long originDetailId;

}
