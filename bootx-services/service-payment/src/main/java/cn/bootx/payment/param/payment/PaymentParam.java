package cn.bootx.payment.param.payment;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
*
* @author xxm
* @date 2021/7/21
*/
@Data
@Accessors(chain = true)
@ApiModel("支付记录")
public class PaymentParam implements Serializable {
    private static final long serialVersionUID = 1082022943904710448L;

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty(value = "关联的业务id")
    private String businessId;

    @ApiModelProperty("商户应用appId")
    private String appId;

    @ApiModelProperty("是否是异步支付")
    private boolean syncPayMode;

    @ApiModelProperty("异步支付方式")
    private Integer syncPayTypeCode;

    @ApiModelProperty("支付状态")
    private int payStatus;

    @ApiModelProperty("错误码")
    private String errorCode;

}
