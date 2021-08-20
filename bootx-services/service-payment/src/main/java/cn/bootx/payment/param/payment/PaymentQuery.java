package cn.bootx.payment.param.payment;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* @author xxm
* @date 2021/7/21 
*/
@Data
@Accessors(chain = true)
@ApiModel("查询参数")
public class PaymentQuery implements Serializable {
    private static final long serialVersionUID = 7071042101962400106L;

    @ApiModelProperty(value = "关联的业务id")
    private String businessId;

    @ApiModelProperty("是否是异步支付")
    private Boolean syncPayMode;

    @ApiModelProperty("异步支付方式")
    private Integer syncPayTypeCode;

    @ApiModelProperty("支付状态")
    private Integer payStatus;

    @ApiModelProperty("错误码")
    private String errorCode;
}
