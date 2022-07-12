package cn.bootx.payment.mq;

import cn.bootx.payment.code.PaymentEventCode;
import cn.bootx.payment.core.pay.service.PaySyncService;
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
    private final PaySyncService paySyncService;

    /**
     * 支付超时事件 TODO 先以与网关同步信息作为实现, 后期根据业务分析情况进行优化
     * TODO 微信的sx接口超时设置无效, 后期手动吧微信的支付但手动给关闭了
     */
    @RabbitListener(queues = PaymentEventCode.PAYMENT_EXPIRED_TIME)
    public void PaymentExpiredTime(Long paymentId){
        log.info("支付超时通知: {}",paymentId);
        paySyncService.syncByPaymentId(paymentId);
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
