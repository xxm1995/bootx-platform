package cn.bootx.payment.dto.paymodel.wallet;

import cn.bootx.payment.code.paymodel.WalletCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2020/12/8
*/
@Data
@Accessors(chain = true)
@ApiModel("钱包日志")
public class WalletLogDto implements Serializable {

    private static final long serialVersionUID = -2553004953931903738L;
    @ApiModelProperty("ID")
    private Long id;

    @ApiModelProperty("钱包ID")
    private Long walletId;

    @ApiModelProperty("用户ID")
    private Long userId;

    /**
     * @see WalletCode
     */
    @ApiModelProperty("类型 1开通钱包 2用户主动充值 3系统充值 4admin充值 5支付 6修改安全模式")
    private Integer type;

    @ApiModelProperty("交易记录ID")
    private Long paymentId;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("业务ID")
    private String businessId;

    /**
     * @see WalletCode
     */
    @ApiModelProperty(" 1 系统操作  2管理员操作 3用户操作")
    private Integer operationSource;

    @ApiModelProperty("金额")
    private BigDecimal amount;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

}
