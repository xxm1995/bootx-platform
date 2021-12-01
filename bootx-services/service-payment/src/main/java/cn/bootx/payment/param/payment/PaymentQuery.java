package cn.bootx.payment.param.payment;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* @author xxm
* @date 2021/7/21 
*/
@Data
@Accessors(chain = true)
@Schema(title = "查询参数")
public class PaymentQuery implements Serializable {
    private static final long serialVersionUID = 7071042101962400106L;

    @Schema(name = "关联的业务id")
    private String businessId;

    @Schema(name = "是否是异步支付")
    private Boolean syncPayMode;

    @Schema(name = "异步支付方式")
    private Integer syncPayTypeCode;

    @Schema(name = "支付状态")
    private Integer payStatus;

    @Schema(name = "错误码")
    private String errorCode;
}
