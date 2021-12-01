package cn.bootx.payment.dto.payment;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.payment.code.pay.PayStatusCode;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "具体支付日志基类")
public class BasePaymentDto extends BaseDto {

    @Schema(name = "支付id")
    private Long paymentId;

    @Schema(name = "用户id")
    private Long userId;

    @Schema(name = "关联的业务id")
    private String businessId;

    @Schema(name = "金额")
    private BigDecimal amount;

    /**
     * @see PayStatusCode
     */
    @Schema(name = "支付状态")
    private int payStatus;

    @Schema(name = "支付时间")
    private LocalDateTime payTime;
}
