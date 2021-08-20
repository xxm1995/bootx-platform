package cn.bootx.order.exception.order;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.order.code.OrderCenterErrorCode.ORDER_PAYING;

/**   
* 订单已付款
* @author xxm  
* @date 2020/12/10 
*/
public class OrderPayingException extends BizException {

    public OrderPayingException() {
        super(ORDER_PAYING, "订单已付款");
    }
}
