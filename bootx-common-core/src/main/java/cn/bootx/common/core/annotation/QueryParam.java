package cn.bootx.common.core.annotation;

import java.lang.annotation.*;

/**
 * 查询参数 (方法)
 * @author xxm
 * @date 2022/12/12
 */
@Target({ElementType.TYPE,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface QueryParam {

    /**
     * 匹配条件类型
     */
    CompareTypeEnum type() default CompareTypeEnum.EQ;


    /**
     * 匹配类型
     */
    enum CompareTypeEnum{
        /** 大于 */
        GT,

        /** 大于等于 */
        GE,

        /** 小于 */
        LT,

        /** 小于等于 */
        LE,

        /** 等于 */
        EQ,

        /** 模糊匹配 */
        LIKE,

        /** 左模糊 */
        LIKE_LEFT,

        /** 右模糊 */
        LIKE_RIGHT,

        /** 是否为空, 只作用在布尔类型上, true 代表 is null, false 代表 not null */
        IS_NULL;
    }
}
