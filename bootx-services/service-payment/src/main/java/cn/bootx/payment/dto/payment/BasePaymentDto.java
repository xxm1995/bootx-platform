package cn.bootx.payment.dto.payment;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.payment.code.pay.PayStatusCode;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2021/2/25
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel("具体支付日志基类")
public class BasePaymentDto extends BaseDto {

    @ApiModelProperty("支付id")
    private Long paymentId;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "关联的业务id")
    private String businessId;

    @ApiModelProperty(value = "金额")
    private BigDecimal amount;

    /**
     * @see PayStatusCode
     */
    @ApiModelProperty("支付状态")
    private int payStatus;

    @ApiModelProperty(value = "支付时间")
    private LocalDateTime payTime;
}
