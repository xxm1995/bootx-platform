package cn.bootx.common.core.annotation;

import java.lang.annotation.*;

/**
* 数据权限控制注解
* @author xxm  
* @date 2021/12/22 
*/
@Target({ElementType.METHOD,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface Permission {

    /**
     * 数据权限
     */
    boolean dataPerm() default true;

    /**
     * 查询字段权限
     */
    boolean selectFieldPerm() default true;

}
