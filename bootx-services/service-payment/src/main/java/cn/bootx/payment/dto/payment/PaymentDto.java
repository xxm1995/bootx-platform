package cn.bootx.payment.dto.payment;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2020/12/9
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "支付记录")
public class PaymentDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = 3269223993950227228L;

    @Schema(description= "用户ID")
    private Long userId;

    @Schema(description= "关联的业务id")
    private String businessId;

    @Schema(description= "是否是异步支付")
    private boolean syncPayMode;

    @Schema(description= "异步支付方式")
    private Integer syncPayTypeCode;

    @Schema(description= "支付时间")
    private LocalDateTime payTime;

    @Schema(description= "过期时间")
    private LocalDateTime expiredTime;

    @Schema(description= "支付状态")
    private int payStatus;

    @Schema(description= "金额")
    private BigDecimal amount;

    @Schema(description= "错误码")
    private String errorCode;

    /**
     * @see PayChannelInfo
     */
    @Schema(description= "支付类型信息")
    private String payTypeInfo;

}
