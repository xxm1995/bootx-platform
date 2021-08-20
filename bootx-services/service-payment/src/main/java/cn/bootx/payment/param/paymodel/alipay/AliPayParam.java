package cn.bootx.payment.param.paymodel.alipay;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;


/**
 * @author xxm
 * @date 2021/2/27
 */
@Data
@Accessors(chain = true)
@ApiModel("支付宝支付参数")
public class AliPayParam implements Serializable {
    private static final long serialVersionUID = 7467373358780663978L;

    @ApiModelProperty("授权码(主动扫描用户的付款码)")
    private String authCode;
}
