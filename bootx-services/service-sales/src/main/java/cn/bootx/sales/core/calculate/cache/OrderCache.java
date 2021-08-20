package cn.bootx.sales.core.calculate.cache;

import cn.bootx.sales.core.coupon.entity.Coupon;
import cn.bootx.sales.dto.order.OrderStrategyMappingResult;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("订单计算缓存对象")
public class OrderCache implements Serializable {
    private static final long serialVersionUID = -7600415200619006458L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("code")
    private String code;

    @ApiModelProperty("支付时间")
    private LocalDateTime payTime;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("购买人ID")
    private Long userId;

    @ApiModelProperty("状态")
    private Integer status;

    @ApiModelProperty("类型")
    private Integer type;

    @ApiModelProperty("总金额")
    private BigDecimal totalAmount;

    @ApiModelProperty("实付金额")
    private BigDecimal payAmount;

    @ApiModelProperty("渠道ID")
    private Long channelId;

    @ApiModelProperty("订单明细")
    private List<OrderDetailCache> details;

    @ApiModelProperty("优惠券明细")
    private List<Coupon> coupons;

    @ApiModelProperty("优惠映射")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();


}
