package cn.bootx.demo.core.mq.rabbit;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**   
* 演示RabbitMQ消息队列配置
* @author xxm  
* @date 2022/5/30 
*/
@Configuration
public class DemoRabbitMqConfiguration {

    /** 测试demo消息队列 */
    @Bean
    public Queue demoTestQueue() {
        return new Queue("demo.testMq");
    }
    /** 交换机 */
    @Bean
    public DirectExchange demoExchange() {
        return new DirectExchange("service.demo");
    }
    /** 绑定测试队列和交换机 */
    @Bean
    public Binding bindDemoMq() {
        return BindingBuilder.bind(demoTestQueue())
                .to(demoExchange())
                .with("demo.testMq");
    }
}
