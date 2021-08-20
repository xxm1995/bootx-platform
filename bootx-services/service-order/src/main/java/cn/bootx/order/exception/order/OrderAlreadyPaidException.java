package cn.bootx.order.exception.order;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.order.code.OrderCenterErrorCode.ORDER_ALREADY_PAID;

/**
 * 订单已支付
* @author xxm
* @date 2020/12/10
*/
public class OrderAlreadyPaidException extends BizException {

    public OrderAlreadyPaidException() {
        super(ORDER_ALREADY_PAID, "订单已支付");
    }
}

