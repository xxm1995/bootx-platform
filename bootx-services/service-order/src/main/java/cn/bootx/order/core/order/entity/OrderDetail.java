package cn.bootx.order.core.order.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.order.core.order.convert.OrderConvert;
import cn.bootx.order.dto.order.OrderDetailDto;
import cn.bootx.order.param.order.OrderDetailParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.List;

/**
 * 订单明细
 * @author xxm
 * @date 2020/10/15
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("oc_order_detail")
public class OrderDetail extends MpBaseEntity implements EntityBaseFunction<OrderDetailDto> {

    /** 订单id */
    private Long orderId;

    /** 店铺id */
    private Long shopId;

    /** 类目 */
    private Long categoryId;

    /** 商品id */
    private Long goodsId;

    /** 库存id */
    private Long skuId;

    /** 商品名称 */
    private String goodsTitle;

    /** 商品价格 */
    private BigDecimal goodsPrice;

    /** 数量 */
    private int num;

    /** 总价 */
    private BigDecimal totalAmount;

    /** 支付价 */
    private BigDecimal payAmount;

    /** 状态 */
    private Integer state;

    /** 策略映射 */
    @TableField(exist = false)
    private List<OrderStrategyMapping> mappings;

    public static OrderDetail init(OrderDetailParam in){
        return OrderConvert.CONVERT.convert(in);
    }

    @Override
    public OrderDetailDto toDto() {
        return OrderConvert.CONVERT.convert(this);
    }
}
