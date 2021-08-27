package cn.bootx.common.mybatisplus.query.entity;


import lombok.extern.slf4j.Slf4j;

/**
 * @author somliy
 * @date 2020/6/7 15:23
 */
@Slf4j
public class AutoQueryGeneratorCode {

    public static final String SQL_RULES_COLUMN = "SQL_RULES_COLUMN";
    /**
     * 单引号
     */
    public static final String SQL_SQ = "'";
    public static final String BEGIN = "_begin";
    public static final String END = "_end";
    /**
     * 数字类型字段，拼接此后缀 接受多值参数
     */
    public static final String MULTI = "_MultiString";
    public static final String STAR = "*";
    public static final String COMMA = ",";
    public static final String NOT_EQUAL = "!";
    /**
     * 页面带有规则值查询，空格作为分隔符
     */
    public static final String QUERY_SEPARATE_KEYWORD = " ";

    // --------------------------------------------------------------------------参数
    /**
     * 高级查询前端传来的参数名
     */
    public static final String SUPER_QUERY_PARAMS = "queryItems";
    /**
     * 高级查询前端传来的拼接方式参数名
     */
    public static final String SUPER_QUERY_MATCH_TYPE = "queryType";
    /**
     * 排序列
     */
    public static final String ORDER_COLUMN = "column";
    /**
     * 排序方式
     */
    public static final String ORDER_TYPE = "order";
    public static final String ORDER_TYPE_ASC = "ASC";

    /**
     * 空值
     */
    public static final String EMPTY = "[{}]";

}
