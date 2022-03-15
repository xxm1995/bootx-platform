package cn.bootx.payment.core.pay.strategy;

import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.core.pay.exception.ExceptionInfo;
import cn.bootx.payment.core.pay.func.AbsPayStrategy;
import cn.bootx.payment.core.paymodel.voucher.service.VoucherPayService;
import cn.bootx.payment.core.paymodel.voucher.service.VoucherPaymentService;
import cn.bootx.payment.core.paymodel.voucher.service.VoucherService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**   
* 储值卡支付
* @author xxm  
* @date 2022/3/13 
*/
@Slf4j
@Scope(SCOPE_PROTOTYPE)
@Service
@RequiredArgsConstructor
public class VoucherStrategy extends AbsPayStrategy {
    private final VoucherPayService voucherPayService;
    private final VoucherService voucherService;
    private final VoucherPaymentService voucherPaymentService;

    @Override
    public int getType() {
        return PayChannelCode.VOUCHER;
    }

    /**
     * 支付前处理
     */
    @Override
    public void doBeforePayHandler() {
        // 获取并校验余额
    }

    @Override
    public void doPayHandler() {

    }

    @Override
    public void doErrorHandler(ExceptionInfo exceptionInfo) {

    }

    @Override
    public void doCloseHandler() {

    }

    @Override
    public void doRefundHandler() {

    }
}
