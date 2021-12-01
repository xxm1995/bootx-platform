package cn.bootx.sales.core.calculate.cache;

import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.dto.order.OrderStrategyMappingResult;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * @author xxm
 * @date 2020/10/11
 */
@Data
@Accessors(chain = true)
@Schema(title = "订单计算缓存对象")
public class OrderCache implements Serializable {
    private static final long serialVersionUID = -7600415200619006458L;

    @Schema(name = "主键ID")
    private Long id;

    @Schema(name = "code")
    private String code;

    @Schema(name = "支付时间")
    private LocalDateTime payTime;

    @Schema(name = "创建时间")
    private LocalDateTime createTime;

    @Schema(name = "购买人ID")
    private Long userId;

    @Schema(name = "状态")
    private Integer status;

    @Schema(name = "类型")
    private Integer type;

    @Schema(name = "总金额")
    private BigDecimal totalAmount;

    @Schema(name = "实付金额")
    private BigDecimal payAmount;

    @Schema(name = "渠道ID")
    private Long channelId;

    @Schema(name = "订单明细")
    private List<OrderDetailCache> details;

    @Schema(name = "优惠券明细")
    private List<Coupon> coupons;

    @Schema(name = "优惠映射")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();


}
