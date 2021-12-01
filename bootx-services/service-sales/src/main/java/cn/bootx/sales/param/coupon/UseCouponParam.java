package cn.bootx.sales.param.coupon;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "优惠券使用")
public class UseCouponParam implements Serializable {
    private static final long serialVersionUID = 7400322396295360022L;

    @Schema(name = "订单Id")
    private Long orderId;

    @Schema(name = "优惠券Id")
    private List<Long> couponIds;

}
