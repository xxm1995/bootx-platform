package cn.bootx.payment.param.paymodel.wallet;

import cn.bootx.payment.code.paymodel.WalletCode;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* 钱包支付参数
* @author xxm
* @date 2020/12/8
*/
@Data
@Accessors(chain = true)
@Schema(title = "钱包支付参数")
public class WalletPayParam implements Serializable {

    private static final long serialVersionUID = 3255160458016870367L;

    @Schema(name = "用户ID")
    private Long userId;

    @Schema(name = "操作人")
    private Long operatorId;

    /**
     * @see WalletCode
     */
    @Schema(name = "操作源 1系统 2管理员 3用户")
    private Integer operationSource;

}
