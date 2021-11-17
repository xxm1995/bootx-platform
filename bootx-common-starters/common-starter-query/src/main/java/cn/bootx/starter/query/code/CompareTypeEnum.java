package cn.bootx.starter.query.code;

import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
* 匹配条件类型
* @author xxm
* @date 2021/11/17
*/
@Getter
@AllArgsConstructor
public enum CompareTypeEnum {

    GT( "gt", ">","大于"),

    GE( "ge", ">=","大于等于"),

    LT( "lt", "<","小于"),

    LE( "le", "<=","小于等于"),

    EQ( "eq", "=","等于"),

    NE( "ne", "!=","不等于"),

    IN( "in", "IN","包含"),

    LIKE( "like", "LIKE","全模糊"),

    LEFT_LIKE( "left_like", "LEFT_LIKE","左模糊"),

    RIGHT_LIKE( "right_like", "RIGHT_LIKE","右模糊");

    private final String code;
    private final String value;
    private final String msg;

    public static CompareTypeEnum getByValue(String code) {
        if (StrUtil.isEmpty(code)) {
            return null;
        }
        for (CompareTypeEnum val : values()) {
            if (val.getCode().equals(code)) {
                return val;
            }
        }
        return null;
    }
}
