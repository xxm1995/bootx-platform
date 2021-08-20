package cn.bootx.payment.exception.payment;

import cn.bootx.common.core.exception.FatalException;
import cn.bootx.payment.code.PaymentCenterErrorCode;

/**
* @author xxm
* @date 2020/12/9
*/
public class PaymentUnsupportedMethodException extends FatalException {

    public PaymentUnsupportedMethodException() {
        super(PaymentCenterErrorCode.PAYMENT_METHOD_UNSUPPORT, "不支持的付款方式");
    }
}
