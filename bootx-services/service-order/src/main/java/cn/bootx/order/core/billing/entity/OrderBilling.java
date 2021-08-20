package cn.bootx.order.core.billing.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.order.core.billing.convert.BillingConvert;
import cn.bootx.order.dto.billing.OrderBillingDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**   
* 订单账单
* @author xxm  
* @date 2020/12/11 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pc_order_billing")
public class OrderBilling extends MpBaseEntity implements EntityBaseFunction<OrderBillingDto> {

    /** 用户id */
    private Long userId;

    /** 渠道id */
    private Long channelId;

    /** 订单id */
    private Long orderId;

    /** 支付类型 */
    private Integer payType;

    /** 金额 */
    private BigDecimal amount;

    /**
     * 交易数量（积分，代金券，兑换券的场合具体数量
     */
    private Integer count;

    /** 业务id */
    private String businessId;

    @Override
    public OrderBillingDto toDto() {
        return BillingConvert.CONVERT.convert(this);
    }
}
