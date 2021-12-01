package cn.bootx.payment.param.payment;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "支付记录")
public class PaymentParam implements Serializable {
    private static final long serialVersionUID = 1082022943904710448L;

    @Schema(description= "用户ID")
    private Long userId;

    @Schema(description= "关联的业务id")
    private String businessId;

    @Schema(description= "商户应用appId")
    private String appId;

    @Schema(description= "是否是异步支付")
    private boolean syncPayMode;

    @Schema(description= "异步支付方式")
    private Integer syncPayTypeCode;

    @Schema(description= "支付状态")
    private int payStatus;

    @Schema(description= "错误码")
    private String errorCode;

}
