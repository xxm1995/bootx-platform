package cn.bootx.common.core.annotation.actable;

import java.lang.annotation.*;

/**
 * 设置字段唯一约束
 *
 * @author sunchenbin
 * @version 2019年6月14日 下午6:12:48
 */
@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Unique {

	/**
	 * 唯一约束的名字，不设置默认为{actable_uni_当前标记字段名@Column的name}<p>
	 * 如果设置了名字例如union_name,系统会默认在名字前加auni_前缀，也就是uni_union_name
	 */
	String value() default "";

	/**
	 * 唯一约束的字段名，不设置默认为当前标记字段名@Column的name
	 * <p>可设置多个建立联合唯一{"login_mobile","login_name"}
	 */
	String[] columns() default {};
}
