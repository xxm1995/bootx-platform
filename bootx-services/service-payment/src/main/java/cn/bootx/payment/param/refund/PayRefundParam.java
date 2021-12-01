package cn.bootx.payment.param.refund;

import cn.bootx.payment.param.pay.PayModeParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

;

/**
* @author xxm
* @date 2020/12/10
*/
@Data
@Accessors(chain = true)
@Schema(title = "退款接口参数")
public class PayRefundParam implements Serializable {

    public static final int TARGET_DEFAULT = 0;

    public static final int TARGET_WALLET = 1;
    private static final long serialVersionUID = 6478736671305633990L;

    @Schema(description= "退款订单信息", required = true)
    @NotNull(message = "returnOrderParam null")
    private PayReturnOrderParam payReturnOrderParam;

    @Schema(description= "交易目的", required = true)
    @NotNull(message = "purpose null")
    private int purpose;

    @Schema(description= "订单名目", required = true)
    @NotNull(message = "orderSubject null")
    private int subject;

    @Schema(description= "支付信息")
    private List<PayModeParam> payModeParamList;

    @Schema(description= "退款费用(正值)", required = true)
    private BigDecimal refundAmount;

    @Schema(description= "退积分(正值)", required = true)
    private int refundCount;

    @Schema(description= "可退款的billingItem", required = true)
    @NotNull(message = "refundOrderItemIds null")
    private List<Long> refundOrderItemIds;

    @Schema(description= "手续费")
    private BigDecimal operationFee;


    @Schema(description= "chargeback等场景下需要额外支付给银行的手续费")
    private BigDecimal extraFee;

    @Schema(description= "退款详情", required = false)
    private List<PayRefundDetailParam> payRefundDetailParams;

    @Schema(description= "额外行李票")
    private BigDecimal extraLuggageFee;

    @Schema(description= "退款目的地,0 default,1 wallet`")
    private int target;

    @Schema(description= "当退款到钱包的时候的钱包ID")
    private Long walletId;

    @Schema(description= "业务id")
    private String businessId;

}
