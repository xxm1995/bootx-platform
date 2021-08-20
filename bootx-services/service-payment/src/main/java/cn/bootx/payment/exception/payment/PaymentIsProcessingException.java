package cn.bootx.payment.exception.payment;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.PaymentCenterErrorCode;

/**   
* 付款正在处理中
* @author xxm  
* @date 2020/12/8 
*/
public class PaymentIsProcessingException extends BizException {

    public PaymentIsProcessingException() {
        super(PaymentCenterErrorCode.PAYMENT_IS_PROCESSING, "付款正在处理中");
    }
}