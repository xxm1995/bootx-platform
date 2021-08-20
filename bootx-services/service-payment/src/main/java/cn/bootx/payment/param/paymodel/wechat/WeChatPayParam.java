package cn.bootx.payment.param.paymodel.wechat;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
*
* @author xxm
* @date 2021/6/21
*/
@Data
@Accessors(chain = true)
@ApiModel("微信支付参数")
public class WeChatPayParam {

    @ApiModelProperty("微信openId")
    private String openId;

    @ApiModelProperty("授权码(主动扫描用户的付款码)")
    private String authCode;
}
