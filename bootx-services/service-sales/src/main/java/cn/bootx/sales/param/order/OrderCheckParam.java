package cn.bootx.sales.param.order;

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
@ApiModel(value = "订单参数")
public class OrderCheckParam implements Serializable {

    private static final long serialVersionUID = 546385575171313726L;

    @ApiModelProperty("code")
    private String code;

    @ApiModelProperty("购者id")
    private Long userId;

    @ApiModelProperty("渠道id")
    private Long channelId;

    @ApiModelProperty("订单类型")
    private Integer type;

    @ApiModelProperty("总金额")
    private BigDecimal totalAmount;

    @ApiModelProperty("订单明细")
    private List<OrderDetailCheckParam> details;

    @ApiModelProperty("选择的优惠券")
    private List<Long> couponIds;

    @ApiModelProperty(value = "全部待选优惠券",hidden = true)
    private List<Long> allCouponIds;

    

}
