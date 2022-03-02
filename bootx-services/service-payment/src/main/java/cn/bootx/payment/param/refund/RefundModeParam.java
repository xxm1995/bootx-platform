package cn.bootx.payment.param.refund;

import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.param.pay.PayModeParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
* 退款方式参数
* @author xxm
* @date 2022/3/2
*/
@Data
@Accessors(chain = true)
@Schema(title = "退款方式参数")
public class RefundModeParam {

    /**
     * @see PayChannelCode
     */
    @Schema(description= "支付通道", required = true)
    private int payChannel;

    @Schema(description= "支付金额", required = true)
    private BigDecimal amount;

    /**
     * 转换成支付方式参数
     */
    public PayModeParam toPayModeParam(){
        return new PayModeParam()
                .setPayChannel(getPayChannel())
                .setAmount(getAmount());
    }
}
