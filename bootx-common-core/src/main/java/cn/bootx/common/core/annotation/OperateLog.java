package cn.bootx.common.core.annotation;

import cn.bootx.common.core.enums.BusinessType;

import java.lang.annotation.*;

/**   
* 操作日志注解
* @author xxm  
* @date 2021/8/13 
*/
@Target({ ElementType.PARAMETER, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Repeatable(value = OperateLogs.class)
@Inherited
public @interface OperateLog {

    /**
     * 模块
     */
    String title() default "";

    /**
     * 业务操作类型
     */
    BusinessType businessType() default BusinessType.OTHER;

    /**
     * 是否保存请求参数
     */
    boolean saveParam() default false;

    /**
     * 是否保存返回参数
     */
    boolean saverReturn() default false;

}
