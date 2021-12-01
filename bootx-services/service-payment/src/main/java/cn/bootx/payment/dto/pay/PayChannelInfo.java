package cn.bootx.payment.dto.pay;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
* @author xxm
* @date 2020/12/8
*/
@Data
@Accessors(chain = true)
@Schema(title = "支付通道信息")
public class PayChannelInfo implements Serializable {

    private static final long serialVersionUID = -7757908686367215682L;
    @Schema(name = "类型")
    private int payChannel;

    @Schema(name = "支付类型")
    private int payWay;

    @Schema(name = "金额")
    private BigDecimal amount;

    @Schema(name = "数量")
    private int count;

    @Schema(name = "扩展参数的json字符串",hidden = true)
    private String extraParamsJson;

}
