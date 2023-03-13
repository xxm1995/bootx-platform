package cn.bootx.common.rabbit;

import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;
import org.springframework.context.annotation.ComponentScan;

/**
 * RabbitMQ配置
 *
 * @author xxm
 * @date 2022/5/3
 */
@ComponentScan
@AutoConfiguration
@ConfigurationPropertiesScan
public class RabbitMqCommonAutoConfiguration {

}
