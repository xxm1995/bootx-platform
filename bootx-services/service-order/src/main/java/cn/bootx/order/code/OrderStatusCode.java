package cn.bootx.order.code;

/**   
* 订单状态
* @author xxm  
* @date 2020/11/27 
*/
public interface OrderStatusCode {

    /** 未支付 */
    int STATUS_NORMAL = 0;
    /** 支付中 */
    int STATUS_PAYING = 1;
    /** 已支付未发货 */
    int STATUS_NOT_YET_SHIPPED = 2;
    /** 已支付已完成 */
    int STATUS_PAYED = 3;
    /** 已取消 */
    int STATUS_CANCEL = 4;

}
