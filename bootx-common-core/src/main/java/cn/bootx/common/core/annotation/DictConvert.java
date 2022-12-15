package cn.bootx.common.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 字典翻译注解
 * @author xxm
 * @date 2022/12/14
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface DictConvert {

    /**
     * 字典编码
     */
    String dicCode();

    /**
     * 来源字段 默认为自身
     */
    String source() default "";

    /**
     * 目标字段 默认为自身
     */
    String target() default "";


}
