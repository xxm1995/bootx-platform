package cn.bootx.payment.code.pay;

/**   
* 支付状态
* @author xxm  
* @date 2021/3/1 
*/
public interface PayStatusCode {

    /**
     * 支付状态
     * 0.支付中
     * 1.成功
     * 2.失败
     * 3.支付取消(超时/手动取消/订单已经关闭,撤销支付单)
     */
    int TRADE_PROGRESS = 0;
    int TRADE_SUCCESS = 1;
    int TRADE_FAIL = 2;
    int TRADE_CANCEL = 3;

    /**
     * 回调信息支付状态 0.失败 2.成功
     */
    int NOTIFY_TRADE_FAIL = 0;
    int NOTIFY_TRADE_SUCCESS = 1;

    /** 回调处理状态 0.失败 2.成功 */
    int NOTIFY_PROCESS_FAIL = 0;
    int NOTIFY_PROCESS_SUCCESS = 1;
}
