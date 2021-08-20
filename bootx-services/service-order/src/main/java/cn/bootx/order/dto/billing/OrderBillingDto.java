package cn.bootx.order.dto.billing;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
* @author xxm
* @date 2020/12/9
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel(value = "订单账单")
public class OrderBillingDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = 6684557809868264317L;

    @ApiModelProperty(value = "账户")
    private Long userId;

    @ApiModelProperty(value = "订单id")
    private Long orderId;

    @ApiModelProperty(value = "支付通道")
    private Integer payType;

    @ApiModelProperty(value = "支付类型名称")
    private String payTypeName;

    @ApiModelProperty(value = "支付金额")
    private BigDecimal amount;

    @ApiModelProperty(value = "使用数量")
    private int count;

    @ApiModelProperty(value = "业务主键")
    private String businessId;

    private List<OrderItemBillingDto> orderItemBillings;
}