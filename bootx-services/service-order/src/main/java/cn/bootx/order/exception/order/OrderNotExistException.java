package cn.bootx.order.exception.order;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.order.code.OrderCenterErrorCode.ORDER_NOT_EXIST;

/**
 * 订单不存在
 * @author xxm
 * @date 2020/11/26
 */
public class OrderNotExistException extends BizException {
    public OrderNotExistException() {
        super(ORDER_NOT_EXIST, "订单不存在");
    }
}
