package cn.bootx.starter.query.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * 参数类型
 * @author xxm
 * @date 2021/11/17
 */
@Getter
@AllArgsConstructor
public enum ParamTypeEnum {

    /** 数字 */
    INTEGER(),

    /** 字符串 */
    STRING(),

    /** 浮点数 */
    DOUBLE(),

    /** 日期 */
    DATE(),

    /** 时间 */
    TIME(),

    /** 日期时间 */
    DATE_TIME(),

    /** 布尔 */
    BOOLEAN();
}
