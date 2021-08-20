package cn.bootx.payment.dto.paymodel.alipay;

import cn.bootx.payment.dto.payment.BasePaymentDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/2/27
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("支付宝支付记录")
public class AliPaymentDto extends BasePaymentDto implements Serializable {
    private static final long serialVersionUID = 6883103229754466130L;

    @ApiModelProperty("支付宝交易号")
    private String tradeNo;
}
