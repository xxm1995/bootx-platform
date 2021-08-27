package cn.bootx.common.mybatisplus.query.code;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author somliy
 * @date 2020/6/7 15:23
 */
@Getter
@AllArgsConstructor
public enum MatchTypeEnum {
    /**
     * and
     */
    AND("AND", "and"),
    /**
     * or
     */
    OR("OR", "or");

    /**
     * 类型
     */
    private final String type;
    /**
     * 描述
     */
    private final String description;

}
