package cn.bootx.payment.dto.paymodel.wallet;

import cn.bootx.payment.dto.payment.BasePaymentDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/8
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("钱包支付记录")
public class WalletPaymentDto extends BasePaymentDto implements Serializable {
    private static final long serialVersionUID = 8238920331255597223L;

    @ApiModelProperty(value = "钱包ID")
    private Long walletId;

}




