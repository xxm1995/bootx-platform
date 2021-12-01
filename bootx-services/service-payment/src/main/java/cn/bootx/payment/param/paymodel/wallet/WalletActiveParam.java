package cn.bootx.payment.param.paymodel.wallet;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

;

/**
* @author xxm
* @date 2020/12/8
*/
@Data
@Accessors(chain = true)
@Schema(title = "开通钱包参数")
public class WalletActiveParam implements Serializable {

    private static final long serialVersionUID = 1642791492198634387L;
    @Schema(name = "用户ID")
    private Long userId;

    @Schema(hidden = true)
    private BigDecimal presentBalance;

}
