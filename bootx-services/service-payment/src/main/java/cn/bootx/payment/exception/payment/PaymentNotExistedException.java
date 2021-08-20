package cn.bootx.payment.exception.payment;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.PaymentCenterErrorCode;

/**   
* 付款记录不存在
* @author xxm  
* @date 2020/12/8 
*/
public class PaymentNotExistedException extends BizException {

    public PaymentNotExistedException() {
        super(PaymentCenterErrorCode.PAYMENT_RECORD_NOT_EXISTED, "付款记录不存在");
    }
}