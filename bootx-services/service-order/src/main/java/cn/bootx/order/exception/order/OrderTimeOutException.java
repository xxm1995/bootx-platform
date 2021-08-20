package cn.bootx.order.exception.order;


import cn.bootx.common.core.exception.BizException;

import static cn.bootx.order.code.OrderCenterErrorCode.ORDER_TIME_OUT;

/**
* 订单超时
* @author xxm
* @date 2020/12/10
*/
public class OrderTimeOutException extends BizException {

    public OrderTimeOutException() {
        super(ORDER_TIME_OUT, "订单超时");
    }
}
