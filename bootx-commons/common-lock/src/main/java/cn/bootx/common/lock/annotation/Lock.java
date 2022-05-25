package cn.bootx.common.lock.annotation;


import cn.bootx.common.lock.constant.LockType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.concurrent.TimeUnit;

/**
 * 加锁注解
 *
 * @author xianzhi.chen@hand-china.com 2019年1月14日下午4:07:44
 */
@Target(value = {ElementType.METHOD})
@Retention(value = RetentionPolicy.RUNTIME)
public @interface Lock {

    /**
     * 锁的名称, 不填根据方法自动生成名称, enableNameSpEl 开启后, 可以使用SpEl表达式生成锁名称
     */
    String name() default "";

    /**
     * name 是否使用SpEl表达式
     */
    boolean enableNameSpEl() default false;

    /**
     * 锁类型，默认可公平锁
     */
    LockType lockType() default LockType.FAIR;

    /**
     * 尝试加锁，最多等待时间(秒)
     */
    long waitTime() default 60L;

    /**
     * 上锁以后多少秒自动解锁
     */
    long leaseTime() default 60L;

    /**
     * 锁时长单位
     */
    TimeUnit timeUnit() default TimeUnit.SECONDS;

    /**
     * 自定义业务key 支持SpEl表达式
     */
    String[] keys() default {};
}
