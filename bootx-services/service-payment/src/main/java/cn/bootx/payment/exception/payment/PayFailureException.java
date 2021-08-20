package cn.bootx.payment.exception.payment;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.PaymentCenterErrorCode;

/**
* 付款付款错误
* @author xxm
* @date 2020/12/8
*/
public class PayFailureException extends BizException {

    public PayFailureException() {
        super(PaymentCenterErrorCode.PAY_FAILURE, "支付失败");
    }
}