package cn.bootx.order.core.billing.entity;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
* 支付信息的上下文，将支付参数中的支付方式列表转换成更适合billing拆分的格式
* @author xxm
* @date 2020/12/9
*/
@Data
@Accessors(chain = true)
@ApiModel("支付信息的上下文")
public class PayModeContext {

    /**
     * 当前的支付类型
     */
    private int type;

    /**
     * 当前支付类型支付的金额
     */
    private BigDecimal totalAmount;

    /**
     * 当前支付类型支付的积分数量
     */
    private BigDecimal count;

}
