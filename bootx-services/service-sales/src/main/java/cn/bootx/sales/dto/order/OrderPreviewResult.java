package cn.bootx.sales.dto.order;

import cn.bootx.sales.dto.coupon.CouponDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
* @author xxm
* @date 2020/10/15
*/
@Data
@Accessors(chain = true)
@ApiModel("订单预览结果")
public class OrderPreviewResult implements Serializable {

    private static final long serialVersionUID = 4645952272491229258L;

    @ApiModelProperty("code")
    private String code;

    @ApiModelProperty("购买人ID")
    private Long userId;

    @ApiModelProperty("类型")
    private Integer type;

    @ApiModelProperty("渠道ID")
    private Long channelId;

    @ApiModelProperty("总金额")
    private BigDecimal totalAmount;

    @ApiModelProperty( "待支付总金额")
    private BigDecimal payAmount;

    @ApiModelProperty("优惠券明细")
    private List<CouponDto> coupons;

    @ApiModelProperty( "明细预览")
    List<OrderDetailPreviewResult> orderDetails;

}
