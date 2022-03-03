package cn.bootx.payment.dto.refund;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.payment.dto.payment.RefundableInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**   
* 退款记录
* @author xxm  
* @date 2022/3/2 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "退款记录")
public class RefundRecordDto extends BaseDto {

    @Schema(description = "款订单号")
    private String refundOrderId;

    @Schema(description = "付单号")
    private Long paymentId;

    @Schema(description = "户ID")
    private Long userId;

    @Schema(description = "题")
    private String title;

    @Schema(description = "额")
    private BigDecimal amount;

    @Schema(description = "款终端ip")
    private String clientIp;

    @Schema(description = "款时间")
    private LocalDateTime refundTime;
    /**
     * 退款信息列表
     * @see RefundableInfo
     */
    private String refundableInfo;

    @Schema(description = "款状态")
    private int refundStatus;

    @Schema(description = "误码")
    private String errorCode;

    @Schema(description = "误信息")
    private String errorMsg;
}
