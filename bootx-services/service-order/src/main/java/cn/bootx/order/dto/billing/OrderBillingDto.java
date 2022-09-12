package cn.bootx.order.dto.billing;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "订单账单")
public class OrderBillingDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = 6684557809868264317L;

    @Schema(description= "账户")
    private Long userId;

    @Schema(description= "订单id")
    private Long orderId;

    @Schema(description= "支付通道")
    private Integer payType;

    @Schema(description= "支付类型名称")
    private String payTypeName;

    @Schema(description= "支付金额")
    private BigDecimal amount;

    @Schema(description= "使用数量")
    private int count;

    @Schema(description= "业务主键")
    private String businessId;

    private List<OrderItemBillingDto> orderItemBillings;
}