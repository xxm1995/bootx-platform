package cn.bootx.common.core.annotation;

import cn.bootx.common.core.enums.BusinessType;

import java.lang.annotation.*;

/**   
* 日志注解
* @author xxm  
* @date 2021/8/13 
*/
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Log {

    /**
     * 模块
     */
    String title() default "";

    /**
     * 功能
     */
    BusinessType businessType() default BusinessType.OTHER;

    /**
     * 是否保存请求参数
     */
    boolean isParam() default false;

    /**
     * 是否保存返回参数
     */
    boolean isrReturn() default false;

}
