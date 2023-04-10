package cn.bootx.common.core.annotation.actable;

import cn.bootx.common.core.code.actable.MySqlFieldType;

import java.lang.annotation.*;

/**
 * 建表的必备注解
 *
 * @author sunchenbin, Spet
 * @version 2019/07/06
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Column {

    /**
     * 字段名
     * @return 字段名：不填默认使用属性名作为表字段名
     */
    String value() default "";

    /**
     * 字段名
     * @return 字段名：不填默认使用属性名作为表字段名
     */
    String name() default "";

    /**
     * 数据库字段排序, 数字小的在前面,大的在后面
     */
    int order() default 0;

    /**
     * 字段类型：不填默认使用属性的数据类型进行转换，转换失败的字段不会添加
     * 仅支持cn.bootx.common.actable.constants.MySqlTypeConstant中的枚举数据类型
     * 不填默认转换类：cn.bootx.common.actable.command.JavaToMysqlType
     * @return 字段类型
     */
    MySqlFieldType type() default MySqlFieldType.DEFAULT;

    /**
     * 字段长度，默认是255
     * @return 默认字段长度，默认是255
     */
    int length() default 255;

    /**
     * 小数点长度，默认是0
     * @return 小数点长度，默认是0
     */
    int decimalLength() default 0;

    /**
     * 是否为可以为null，true是可以，false是不可以，默认为true
     * @return 是否为可以为null，true是可以，false是不可以，默认为true
     */
    boolean isNull() default true;

    /**
     * 是否是主键，默认false
     * @return 是否是主键，默认false
     */
    boolean isKey() default false;

    /**
     * 是否自动递增，默认false，只有主键才能使用
     * @return 是否自动递增，默认false
     */
    boolean isAutoIncrement() default false;

    /**
     * 默认值，默认为null
     * @return 默认值
     */
    String defaultValue() default "DEFAULT";

    /**
     * 数据表字段备注
     * @return 默认值，默认为空
     */
    String comment() default "";

    /**
     * 是否排除该字段, 默认不排除
     */
    boolean ignore() default false;

}
