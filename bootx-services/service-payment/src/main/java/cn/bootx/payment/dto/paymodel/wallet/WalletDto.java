package cn.bootx.payment.dto.paymodel.wallet;

import cn.bootx.payment.code.paymodel.WalletCode;
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
@Schema(title = "钱包")
public class WalletDto implements Serializable {

    private static final long serialVersionUID = -1563719305334334625L;
    @Schema(name = "ID,钱包的唯一标识")
    private Long id;

    @Schema(name = "钱包关联的账号ID")
    private Long userId;

    @Schema(name = "钱包余额")
    private BigDecimal balance;

    @Schema(name = "状态 1启用 2禁用")
    private Integer status;

    /**
     * @see WalletCode
     */
    @Schema(name = "保护模式 0:禁用 1:PIN Code 2:Finger/FaceID")
    private Integer protectionMode;
}
