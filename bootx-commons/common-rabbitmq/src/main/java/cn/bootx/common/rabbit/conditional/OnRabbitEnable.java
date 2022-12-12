package cn.bootx.common.rabbit.conditional;

import cn.bootx.common.rabbit.configuration.RabbitMqProperties;
import org.springframework.boot.context.properties.bind.Binder;
import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.type.AnnotatedTypeMetadata;

/**
 * 判断是否在启用了Rabbit, 用来控制在没启用Rabbit情况下. 不将 @RabbitListener 修饰的监听器注册为Bean, 不然会导致无限尝试重连
 * @author xxm
 * @date 2022/12/12
 */
public class OnRabbitEnable implements Condition {
    private final String rabbitPropertiesPrefix = "bootx.common.rabbit";

    /**
     * @param context
     * @param metadata
     * @return
     */
    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        RabbitMqProperties rabbitMqProperties = Binder.get(context.getEnvironment())
                .bind(rabbitPropertiesPrefix, RabbitMqProperties.class)
                .orElse(new RabbitMqProperties());
        return rabbitMqProperties.isEnable();
    }
}
