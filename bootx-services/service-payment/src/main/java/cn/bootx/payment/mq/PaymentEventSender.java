package cn.bootx.payment.mq;

import cn.bootx.payment.code.PaymentEventCode;
import cn.bootx.payment.event.PayCancelEvent;
import cn.bootx.payment.event.PayCompleteEvent;
import cn.bootx.payment.event.PayRefundEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Component;

/**
 * 支付中心消息发送器
 * @author xxm
 * @date 2021/4/22
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class PaymentEventSender {

    private final RabbitTemplate rabbitTemplate;

    /**
     * 支付完成 事件发布
     */
    public void sendPayComplete(PayCompleteEvent event) {
        rabbitTemplate.convertAndSend(
                PaymentEventCode.EXCHANGE_PAYMENT,
                PaymentEventCode.PAY_COMPLETE,
                event
        );
    }

    /**
     * 支付撤销/关闭 事件发布 
     */
    public void sendPayCancel(PayCancelEvent event){
        rabbitTemplate.convertAndSend(
                PaymentEventCode.EXCHANGE_PAYMENT,
                PaymentEventCode.PAY_CANCEL,
                event
        );
    }

    /**
     * 支付退款 事件发布
     */
    public void sendPayRefund(PayRefundEvent event){
        rabbitTemplate.convertAndSend(
                PaymentEventCode.EXCHANGE_PAYMENT,
                PaymentEventCode.PAY_REFUND,
                event
        );
    }


}
