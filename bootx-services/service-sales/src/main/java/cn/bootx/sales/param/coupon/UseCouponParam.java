package cn.bootx.sales.param.coupon;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2021/3/9
*/
@Data
@Accessors(chain = true)
@ApiModel("优惠券使用")
public class UseCouponParam implements Serializable {
    private static final long serialVersionUID = 7400322396295360022L;

    @ApiModelProperty("订单Id")
    private Long orderId;

    @ApiModelProperty("优惠券Id")
    private List<Long> couponIds;

}
