package cn.bootx.payment.dto.paymodel.wechat;

import cn.bootx.payment.dto.payment.BasePaymentDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/6/21
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("微信支付记录")
public class WeChatPaymentDto extends BasePaymentDto implements Serializable {
    private static final long serialVersionUID = -2400358210732595795L;

    @ApiModelProperty("微信交易号")
    private String tradeNo;
}
