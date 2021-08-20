package cn.bootx.order.core.order.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.order.core.order.convert.OrderConvert;
import cn.bootx.order.dto.order.OrderAddressDto;
import cn.bootx.order.dto.order.OrderDto;
import cn.bootx.order.dto.order.OrderInvoiceDto;
import cn.hutool.core.collection.CollUtil;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**   
* 订单
* @author xxm  
* @date 2020/10/15 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("oc_order")
public class Order extends MpBaseEntity implements EntityBaseFunction<OrderDto> {

    /** 编码 */
    private String code;

    /** 渠道 */
    private Long channelId;

    /** 描述 */
    private String description;

    /** 购买用户ID */
    private Long userId;

    /**
     * 状态
     * @see cn.bootx.order.code.OrderStatusCode
     */
    private int status;

    /** 支付时间 */
    private LocalDateTime payTime;

    /** 类型 */
    private Integer type;

    /** 总金额 */
    private BigDecimal totalAmount;

    /** 实付金额 */
    private BigDecimal payAmount;

    /** 所用优惠券 */
    private String couponIds;

    /** 业务id */
    private Long businessId;

    /** 附加参数 */
    private String addition;

    /** 订单明细 */
    @TableField(exist = false)
    private List<OrderDetail> orderDetails;

    /** 收货信息 */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private OrderAddressDto addressInfo;

    /** 发票信息 */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private OrderInvoiceDto invoiceInfo;

    public static Order init(OrderDto in){
        return OrderConvert.CONVERT.convert(in);
    }

    @Override
    public OrderDto toDto() {
        OrderDto dto = OrderConvert.CONVERT.convert(this);
        if (CollUtil.isNotEmpty(orderDetails)){
            dto.setDetails(orderDetails.stream().map(OrderDetail::toDto).collect(Collectors.toList()));
        }
        return dto;
    }
}
