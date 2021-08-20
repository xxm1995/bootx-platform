package cn.bootx.order.code;

/**
* 商品中心
* @author xxm
* @date 2021/3/10
*/
public interface OrderCenterErrorCode {


    /**
     * 订单不存在
     */
    int ORDER_NOT_EXIST = 23015;

    /**
     * 订单超时
     */
    int ORDER_TIME_OUT = 44007;

    /**
     * 订单支付中
     */
    int ORDER_PAYING = 44008;

    /**
     * 订单已支付
     */
    int ORDER_ALREADY_PAID = 44009;

    /**
     * 订单已取消
     */
    int ORDER_CANCELLED = 44010;
}
