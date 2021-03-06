package cn.bootx.payment.mq;

import cn.bootx.payment.code.PaymentEventCode;
import cn.bootx.payment.core.pay.service.PayExpiredTimeService;
import cn.bootx.payment.event.PayCancelEvent;
import cn.bootx.payment.event.PayCompleteEvent;
import cn.bootx.payment.event.PayRefundEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * 消息接收
 * @author xxm
 * @date 2021/4/22
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class PaymentMessageListener {
    private final PayExpiredTimeService payExpiredTimeService;

    /**
     * 支付超时事件处理
     */
    @RabbitListener(queues = PaymentEventCode.PAYMENT_EXPIRED_TIME)
    public void PaymentExpiredTime(Long paymentId){
        payExpiredTimeService.expiredTime(paymentId);
    }

    /**
     * 支付成功
     */
    @RabbitListener(queues = PaymentEventCode.PAY_COMPLETE)
    public void payCancel(PayCompleteEvent event) {
        log.info("支付完成事件:{}",event);
    }

    /**
     * 支付撤销/关闭
     */
    @RabbitListener(queues = PaymentEventCode.PAY_CANCEL)
    public void payCancel(PayCancelEvent event) {
        log.info("支付撤销/关闭事件:{}",event);
    }

    /**
     * 支付退款
     */
    @RabbitListener(queues = PaymentEventCode.PAY_REFUND)
    public void payCancel(PayRefundEvent event) {
        log.info("支付退款事件:{}",event);
    }

}
