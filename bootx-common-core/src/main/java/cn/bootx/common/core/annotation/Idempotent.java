package cn.bootx.common.core.annotation;

import java.lang.annotation.*;

/**   
* 幂等性拦截注解
* @author xxm  
* @date 2021/1/2 
*/
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Idempotent {

    /**
     * 是否开启
     */
    boolean enable() default true;

    /**
     * 超时时间(毫秒)
     */
    long timeout() default 1000*10;

    /**
     * 名称
     */
    String name() default "";
}
