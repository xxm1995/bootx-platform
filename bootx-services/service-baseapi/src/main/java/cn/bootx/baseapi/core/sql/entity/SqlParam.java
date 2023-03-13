package cn.bootx.baseapi.core.sql.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * SQL查询参数
 */
@Getter
@Setter
public class SqlParam {

    /**
     * 参数名称
     */
    private String name;

    /**
     * 类型
     *
     * @see cn.bootx.baseapi.code.QuerySqlCode
     */
    private String type;

}
