package cn.bootx.payment.dto.payment;

import cn.bootx.common.core.rest.dto.BaseDto;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("支付记录")
public class PaymentDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = 3269223993950227228L;

    @ApiModelProperty("用户ID")
    private Long userId;

    @ApiModelProperty(value = "关联的业务id")
    private String businessId;

    @ApiModelProperty("是否是异步支付")
    private boolean syncPayMode;

    @ApiModelProperty("异步支付方式")
    private Integer syncPayTypeCode;

    @ApiModelProperty("支付时间")
    private LocalDateTime payTime;

    @ApiModelProperty("过期时间")
    private LocalDateTime expiredTime;

    @ApiModelProperty("支付状态")
    private int payStatus;

    @ApiModelProperty("金额")
    private BigDecimal amount;

    @ApiModelProperty("错误码")
    private String errorCode;

    /**
     * @see PayChannelInfo
     */
    @ApiModelProperty("支付类型信息")
    private String payTypeInfo;

}
