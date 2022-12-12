package cn.bootx.common.rabbit.conditional;

import org.springframework.context.annotation.Conditional;

import java.lang.annotation.*;

/**
 * 判断系统是否在启用了Rabbit, 未启用的情况下不将Bean注册到系统中
 *
 * 使用场景: 在不使用Rabbit中间件的场合里, 但未去除Rabbit相关代码的情况下, 通过配置文件中关闭Rabbit选项, 来实现系统的正常使用,
 * 不这样处理会导致RabbitMQ进行无限尝试重连服务器
 * 需要在使用 @RabbitListener 标注方法的类上加上这个注解, 让这个对象不注册到系统中
 * @author xxm
 * @date 2022/12/12
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Conditional(OnRabbitEnable.class)
public @interface ConditionalOnRabbit {
}
