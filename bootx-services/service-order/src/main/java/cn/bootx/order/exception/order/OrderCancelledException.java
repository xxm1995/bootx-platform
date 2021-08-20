package cn.bootx.order.exception.order;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.order.code.OrderCenterErrorCode.ORDER_CANCELLED;

/**   
* 订单已取消
* @author xxm 
* @date 2019/5/28 13:51 
*/

public class OrderCancelledException extends BizException {

    public OrderCancelledException() {
        super(ORDER_CANCELLED, "订单被取消");
    }
}
