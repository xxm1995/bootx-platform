package cn.bootx.common.spring.annotation;

import java.lang.annotation.*;

/**
* 获取程序执行时间注解
* @author xxm
* @date 2020/12/22
*/
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface CountTime {
}
