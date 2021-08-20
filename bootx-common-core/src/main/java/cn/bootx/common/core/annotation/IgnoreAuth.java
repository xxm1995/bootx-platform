package cn.bootx.common.core.annotation;

import java.lang.annotation.*;

/**
 * 忽略鉴权, 可以放在controller上和方法上，同时使用时，以方法上的为准
 * @author aeizzz
 */
@Target({ElementType.METHOD,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface IgnoreAuth {
    /**
     * 是否忽略
     */
    boolean ignore() default true;
}