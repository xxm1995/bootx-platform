package cn.bootx.order.dto.order;

import cn.bootx.order.code.OrderStatusCode;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * 订单
 * @author xxm
 * @date 2020/10/11
 */
@Data
@Accessors(chain = true)
@Schema(title = "订单")
public class OrderDto implements Serializable {
    private static final long serialVersionUID = -7600415200619006458L;

    @Schema(description= "主键ID")
    private Long id;

    @Schema(description= "code")
    private String code;

    @Schema(description= "支付时间")
    private LocalDateTime payTime;

    @Schema(description= "订单描述")
    private String description;

    @Schema(description= "创建时间")
    private LocalDateTime createTime;

    @Schema(description= "购买人ID")
    private Long userId;

    /**
     * @see OrderStatusCode
     */
    @Schema(description= "状态")
    private Integer status;

    @Schema(description= "类型")
    private Integer type;

    @Schema(description= "总金额")
    private BigDecimal totalAmount;

    @Schema(description= "实付金额")
    private BigDecimal payAmount;

    @Schema(description= "渠道ID")
    private Long channelId;

    @Schema(description= "所用优惠券")
    private String couponIds;

    @Schema(description= "订单明细")
    private List<OrderDetailDto> details;

    @Schema(description= "优惠金额")
    private List<OrderStrategyMappingDto> mappings = new ArrayList<>();

    @Schema(description= "收货地址")
    private OrderAddressDto orderAddressInfo;

    @Schema(description= "发票信息")
    private OrderInvoiceDto orderInvoiceInfo;

}
