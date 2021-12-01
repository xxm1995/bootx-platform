package cn.bootx.sales.dto.order;

import cn.bootx.sales.dto.coupon.CouponDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

;

/**
* @author xxm
* @date 2020/10/15
*/
@Data
@Accessors(chain = true)
@Schema(title = "订单预览结果")
public class OrderPreviewResult implements Serializable {

    private static final long serialVersionUID = 4645952272491229258L;

    @Schema(name = "code")
    private String code;

    @Schema(name = "购买人ID")
    private Long userId;

    @Schema(name = "类型")
    private Integer type;

    @Schema(name = "渠道ID")
    private Long channelId;

    @Schema(name = "总金额")
    private BigDecimal totalAmount;

    @Schema(name = "待支付总金额")
    private BigDecimal payAmount;

    @Schema(name = "优惠券明细")
    private List<CouponDto> coupons;

    @Schema(name = "明细预览")
    List<OrderDetailPreviewResult> orderDetails;

}
