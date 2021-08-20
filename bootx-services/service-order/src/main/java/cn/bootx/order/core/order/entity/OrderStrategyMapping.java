package cn.bootx.order.core.order.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.order.core.order.convert.OrderConvert;
import cn.bootx.order.dto.order.OrderStrategyMappingDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 订单策略映射
 * 用于保存策略计算过程中的结果，会保存当时计算的订单策略、订单类型（订单/明细）和价格变动数量
 * @author xxm
 * @date 2020/10/11
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("oc_order_strategy_mapping")
public class OrderStrategyMapping extends MpBaseEntity implements EntityBaseFunction<OrderStrategyMappingDto> {

    /** 订单id */
    private Long orderId;

    /** 明细id */
    private Long orderDetailId;

    /** 策略类型  1 活动策略 2 优惠券策略*/
    private Integer strategyType;

    /** 优惠券ID */
    private Long couponId;

    /** 策略ID */
    private Long strategyId;

    /** 策略注册ID */
    private Long strategyRegisterId;

    /** 价格变动 */
    private BigDecimal priceChange;

    /** 描述 */
    private String description;

    @Override
    public OrderStrategyMappingDto toDto() {
        return OrderConvert.CONVERT.convert(this);
    }
}
