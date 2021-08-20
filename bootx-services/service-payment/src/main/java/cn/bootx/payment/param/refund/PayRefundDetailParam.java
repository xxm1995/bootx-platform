package cn.bootx.payment.param.refund;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
* @author xxm
* @date 2020/12/10
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "退款交易参数")
public class PayRefundDetailParam implements Serializable {

    private static final long serialVersionUID = -2598585064286442045L;
    @ApiModelProperty(value = "支付ID", required = true)
    private Long paymentId;

    @ApiModelProperty(value = "哪个订单", required = true)
    private Long orderId;

    @ApiModelProperty(value = "支付类型", required = true)
    private int payType;

    @ApiModelProperty(value = "交易ID(现金没有)")
    private String transactionId;

    @ApiModelProperty(value = "支付卡号")
    private String account;

    @ApiModelProperty(value = "退款费用(正值)", required = true)
    private BigDecimal refundAmount;

}
