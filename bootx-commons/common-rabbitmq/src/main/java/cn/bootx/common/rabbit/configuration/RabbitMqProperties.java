package cn.bootx.common.rabbit.configuration;

import cn.bootx.common.rabbit.conditional.ConditionalOnRabbit;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * MQTT配置
 *
 * @author xxm
 * @date 2022/12/12
 */
@Getter
@Setter
@ConfigurationProperties("bootx.common.rabbit")
public class RabbitMqProperties {

    /**
     * 是否开启 RabbitMQ功能,
     * @see ConditionalOnRabbit 配合此注解使用
     */
    private boolean enable = false;

}
