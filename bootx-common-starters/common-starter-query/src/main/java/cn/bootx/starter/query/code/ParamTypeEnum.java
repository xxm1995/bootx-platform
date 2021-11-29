package cn.bootx.starter.query.code;

import cn.hutool.core.util.StrUtil;
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
    NUMBER("number","数字","number"),

    /** 字符串 */
    STRING("string","字符串","string"),

    /** 布尔 */
    BOOLEAN("boolean","布尔","boolean"),

    /** 日期 */
    DATE("date","日期","date"),

    /** 时间 */
    TIME("time","时间","time"),

    /** 日期时间 */
    DATE_TIME("date_time","日期时间","date_time"),

    /** 列表 */
    LIST("list","列表","string"),

    /** 数字之间 */
    BETWEEN_NUMBER("between_number","数字之间","number"),

    /** 字符串之间 */
    BETWEEN_STRING("between_string","字符串之间","string"),

    /** 日期之间 */
    BETWEEN_DATE("between_date","日期之间","date"),

    /** 时间之间 */
    BETWEEN_TIME("between_time","时间之间","time"),

    /** 日期时间之间 */
    BETWEEN_DATE_TIME("between_date_time","日期时间之间","date_time");

    private final String code;
    private final String name;
    private final String baseType;


    public static ParamTypeEnum getByCode(String code) {
        if (StrUtil.isEmpty(code)) {
            return null;
        }
        for (ParamTypeEnum val : values()) {
            if (val.getCode().equals(code)) {
                return val;
            }
        }
        return null;
    }
}
