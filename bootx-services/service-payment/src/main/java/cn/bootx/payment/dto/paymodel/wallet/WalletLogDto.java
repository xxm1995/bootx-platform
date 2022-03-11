package cn.bootx.payment.dto.paymodel.wallet;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.payment.code.paymodel.WalletCode;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

;

/**
* @author xxm
* @date 2020/12/8
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "钱包日志")
public class WalletLogDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = -2553004953931903738L;

    @Schema(description= "钱包ID")
    private Long walletId;

    @Schema(description= "用户ID")
    private Long userId;

    /**
     * @see WalletCode
     */
    @Schema(description= "类型 1开通钱包 2用户主动充值 3系统充值 4admin充值 5支付 6修改安全模式")
    private Integer type;

    @Schema(description= "交易记录ID")
    private Long paymentId;

    @Schema(description= "备注")
    private String remark;

    @Schema(description= "业务ID")
    private String businessId;

    /**
     * @see WalletCode
     */
    @Schema(description= " 1 系统操作  2管理员操作 3用户操作")
    private Integer operationSource;

    @Schema(description= "金额")
    private BigDecimal amount;

    @Schema(description= "创建时间")
    private LocalDateTime createTime;

}
