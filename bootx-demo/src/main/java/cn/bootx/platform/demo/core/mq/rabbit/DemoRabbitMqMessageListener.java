package cn.bootx.platform.demo.core.mq.rabbit;

import cn.bootx.platform.common.core.rest.ResResult;
import cn.bootx.platform.common.rabbit.conditional.ConditionalOnRabbit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author xxm
 * @date 2022/5/30
 */
@Slf4j
@ConditionalOnRabbit
@Component
@RequiredArgsConstructor
public class DemoRabbitMqMessageListener {

    /**
     * 测试MQ消息
     */
    @RabbitListener(queues = "demo.testMq")
    public void payCancel(ResResult<String> hello) {
        log.info("测试MQ消息 :{}", hello);
    }

}
