package cn.bootx.payment.param.pay;

import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayWayCode;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import cn.bootx.payment.param.paymodel.alipay.AliPayParam;
import cn.bootx.payment.param.paymodel.wechat.WeChatPayParam;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import org.springframework.beans.BeanUtils;

import java.io.Serializable;
import java.math.BigDecimal;

/**
* @author xxm
* @date 2020/12/8
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "支付方式参数")
public class PayModeParam implements Serializable {

    private static final long serialVersionUID = -46959864485463681L;
    /**
     * @see PayChannelCode
     */
    @ApiModelProperty(value = "支付通道", required = true)
    private int payChannel;

    /**
     * @see PayWayCode
     */
    @ApiModelProperty(value = "支付通道下属支付方式", required = true)
    private int payWay;

    @ApiModelProperty(value = "支付金额", required = true)
    private BigDecimal amount;

    /**
     * @see AliPayParam
     * @see WeChatPayParam
     */
    @ApiModelProperty(value = "扩展参数的json字符串")
    private String extraParamsJson;


    public PayChannelInfo toPayTypeInfo() {
        PayChannelInfo payTypeInfo = new PayChannelInfo();
        BeanUtils.copyProperties(this, payTypeInfo);
        return payTypeInfo;
    }
}
