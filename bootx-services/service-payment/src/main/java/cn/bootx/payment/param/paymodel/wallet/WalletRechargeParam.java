package cn.bootx.payment.param.paymodel.wallet;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
* @author xxm
* @date 2020/12/8
*/
@Data
@Accessors(chain = true)
@Schema(title = "钱包充值参数")
public class WalletRechargeParam implements Serializable {

    private static final long serialVersionUID = 73058709379178254L;
    @Schema(name = "钱包ID")
    private Long walletId;

    @Schema(name = "支付记录ID")
    private Long paymentId;

    @Schema(name = "充值金额")
    private BigDecimal amount;

    @Schema(name = "类型 2 主动充值 3 自动充值 4 admin充值")
    private Integer type;

    @Schema(name = "业务ID，对应的充值订单ID等")
    private String businessId;

    @Schema(name = "操作人")
    private Long operatorId;

    @Schema(name = "操作源")
    private Integer operationSource;

    @Schema(name = "订单id")
    private Long orderId;

}
