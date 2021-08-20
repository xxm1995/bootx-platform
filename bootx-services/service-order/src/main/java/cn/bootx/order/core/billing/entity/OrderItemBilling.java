package cn.bootx.order.core.billing.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.order.core.billing.convert.BillingConvert;
import cn.bootx.order.dto.billing.OrderItemBillingDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
* 订单项账单
* @author xxm
* @date 2020/12/11
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pc_order_item_billing")
public class OrderItemBilling extends MpBaseEntity implements EntityBaseFunction<OrderItemBillingDto> {

    /** 账单id */
    private Long orderBillingId;

    /** 用户id */
    private Long userId;

    /** 订单id */
    private Long orderId;

    /** 订单项id */
    private Long orderItemId;

    /** 订单项目skuId */
    private Long skuId;

    /** 支付金额 */
    private BigDecimal amount;

    /** 入账时间 */
    private Long bookkeepingTime;

    /** 原始订单项id */
    private Long sourceItemBillingId;

    /** 原始订单项d */
    private Long sourceOrderItemId;

    @Override
    public OrderItemBillingDto toDto() {
        return BillingConvert.CONVERT.convert(this);
    }
}
