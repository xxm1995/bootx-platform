package cn.bootx.payment.param.paymodel.wallet;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("钱包充值参数")
public class WalletRechargeParam implements Serializable {

    private static final long serialVersionUID = 73058709379178254L;
    @ApiModelProperty("钱包ID")
    private Long walletId;

    @ApiModelProperty("支付记录ID")
    private Long paymentId;

    @ApiModelProperty("充值金额")
    private BigDecimal amount;

    @ApiModelProperty("类型 2 主动充值 3 自动充值 4 admin充值")
    private Integer type;

    @ApiModelProperty("业务ID，对应的充值订单ID等")
    private String businessId;

    @ApiModelProperty("操作人")
    private Long operatorId;

    @ApiModelProperty("操作源")
    private Integer operationSource;

    @ApiModelProperty("订单id")
    private Long orderId;

}
