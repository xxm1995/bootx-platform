package cn.bootx.common.mybatisplus.query.annotation;

import cn.bootx.common.mybatisplus.query.code.QueryRuleEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author 7326
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface QueryColumn {
    // 查询类型  in  like  between  le  lt
    QueryRuleEnum type();

    // 字段名称
    String value() default "";


}
