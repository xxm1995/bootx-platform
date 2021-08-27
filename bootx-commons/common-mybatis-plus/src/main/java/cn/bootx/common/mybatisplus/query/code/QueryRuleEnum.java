package cn.bootx.common.mybatisplus.query.code;

import cn.hutool.core.util.StrUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author somliy
 * @date 2020/6/7 15:38
 */
@Getter
@AllArgsConstructor
public enum QueryRuleEnum {

    GT(">", "gt", "大于"),

    GE(">=", "ge", "大于等于"),

    LT("<", "lt", "小于"),

    LE("<=", "le", "小于等于"),

    EQ("=", "eq", "等于"),

    NE("!=", "ne", "不等于"),

    IN("IN", "in", "包含"),

    LIKE("LIKE", "like", "全模糊"),

    LEFT_LIKE("LEFT_LIKE", "left_like", "左模糊"),

    RIGHT_LIKE("RIGHT_LIKE", "right_like", "右模糊"),

    SQL_RULES("USE_SQL_RULES", "ext", "自定义SQL片段");

    private final String value;

    private final String condition;

    private final String msg;

    public static QueryRuleEnum getByValue(String value) {
        if (StrUtil.isEmpty(value)) {
            return null;
        }
        for (QueryRuleEnum val : values()) {
            if (val.getValue().equals(value) || val.getCondition().equals(value)) {
                return val;
            }
        }
        return null;
    }
}
