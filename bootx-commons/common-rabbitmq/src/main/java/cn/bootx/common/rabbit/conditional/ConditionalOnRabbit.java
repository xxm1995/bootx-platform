package cn.bootx.common.rabbit.conditional;

import org.springframework.context.annotation.Conditional;

import java.lang.annotation.*;

/**
 * 判断系统是否在启用了Rabbit, 未启用的情况下不将Bean注册到系统中
 *
 * 使用场景: 在不使用Rabbit中间件但未去除Rabbit依赖的情况下, 通过配置文件中关闭Rabbit选项，
 * 同时将这个注解到有`@RabbitListener`标志的类上，让这个对象不注册到Spring容器中,
 * 从而避免`RabbitMQ`进行无限尝试重连服务器，导致项目一直抛出异常，影响开发和使用。
 * @author xxm
 * @date 2022/12/12
 */
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Conditional(OnRabbitEnable.class)
public @interface ConditionalOnRabbit {

}
