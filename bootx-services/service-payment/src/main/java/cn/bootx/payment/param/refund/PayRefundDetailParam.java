package cn.bootx.payment.param.refund;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "退款交易参数")
public class PayRefundDetailParam implements Serializable {

    private static final long serialVersionUID = -2598585064286442045L;
    @Schema(description= "支付ID", required = true)
    private Long paymentId;

    @Schema(description= "哪个订单", required = true)
    private Long orderId;

    @Schema(description= "支付类型", required = true)
    private int payType;

    @Schema(description= "交易ID(现金没有)")
    private String transactionId;

    @Schema(description= "支付卡号")
    private String account;

    @Schema(description= "退款费用(正值)", required = true)
    private BigDecimal refundAmount;

}
