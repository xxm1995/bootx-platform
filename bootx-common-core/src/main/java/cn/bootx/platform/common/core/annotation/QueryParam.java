package cn.bootx.platform.common.core.annotation;

import java.lang.annotation.*;

/**
 * 查询参数 生效顺序 QueryParams 查询参数字段 > Entity 数据库实体字段 > QueryParams 查询类 > Entity 数据库实体类
 *
 * @author xxm
 * @date 2022/12/12
 */
@Target({ ElementType.TYPE, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface QueryParam {

    /**
     * 匹配条件类型
     */
    CompareTypeEnum type() default CompareTypeEnum.EQ;

    /**
     * 是否忽略
     */
    boolean ignore() default false;

    /**
     * 名称转换类型, 默认为下划线
     */
    NamingCaseEnum namingCase() default NamingCaseEnum.UNDER_LINE;

    /**
     * 自定义查询字段对应的数据库字段名称. 只可以在字段上标注时使用，标注在类上不生效 配置后，namingCase配置将会无效，会以这项配置数据库字段名称为准
     */
    String fieldName() default "";

    /**
     * 匹配类型
     */
    enum CompareTypeEnum {

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

    /**
     * 名称转换类型
     */
    enum NamingCaseEnum {

        /** 获取数据库实体类配置的数据库字段名称，只可以用在数据库实体类字段上 */
        LAMBDA,
        /** 转换为下划线 */
        UNDER_LINE,
        /** 不进行处理 */
        NONE;

    }

}
