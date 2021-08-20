package cn.bootx.order.dto.order;

import cn.bootx.order.code.OrderStatusCode;
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
 * 订单
 * @author xxm
 * @date 2020/10/11
 */
@Data
@Accessors(chain = true)
@ApiModel("订单")
public class OrderDto implements Serializable {
    private static final long serialVersionUID = -7600415200619006458L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("code")
    private String code;

    @ApiModelProperty("支付时间")
    private LocalDateTime payTime;

    @ApiModelProperty("订单描述")
    private String description;

    @ApiModelProperty("创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty("购买人ID")
    private Long userId;

    /**
     * @see OrderStatusCode
     */
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

    @ApiModelProperty("所用优惠券")
    private String couponIds;

    @ApiModelProperty("订单明细")
    private List<OrderDetailDto> details;

    @ApiModelProperty("优惠金额")
    private List<OrderStrategyMappingDto> mappings = new ArrayList<>();

    @ApiModelProperty("收货地址")
    private OrderAddressDto orderAddressInfo;

    @ApiModelProperty("发票信息")
    private OrderInvoiceDto orderInvoiceInfo;

}
