package cn.bootx.platform.common.rabbit.configuration;

import lombok.RequiredArgsConstructor;
import org.springframework.amqp.rabbit.annotation.RabbitListenerConfigurer;
import org.springframework.amqp.rabbit.listener.RabbitListenerEndpointRegistrar;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.handler.annotation.support.DefaultMessageHandlerMethodFactory;

/**
 * Rabbit 侦听器配置器
 *
 * @author xxm
 * @date 2021/6/25
 */
@Configuration
@RequiredArgsConstructor
public class BootxRabbitListenerConfigurer implements RabbitListenerConfigurer {

    private final DefaultMessageHandlerMethodFactory jsonHandlerMethodFactory;

    @Override
    public void configureRabbitListeners(RabbitListenerEndpointRegistrar registrar) {
        registrar.setMessageHandlerMethodFactory(jsonHandlerMethodFactory);
    }

}
