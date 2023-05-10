package cn.bootx.platform.baseapi.core.sql.entity;

import cn.bootx.platform.baseapi.code.QuerySqlCode;
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
     * @see QuerySqlCode
     */
    private String type;

}
