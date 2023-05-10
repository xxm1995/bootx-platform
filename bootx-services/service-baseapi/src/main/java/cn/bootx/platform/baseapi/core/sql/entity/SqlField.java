package cn.bootx.platform.baseapi.core.sql.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * SQL查询结果字段
 */
@Getter
@Setter
public class SqlField {

    /**
     * 字段名
     */
    private String fieldName;

    /**
     * 显示名称
     */
    private String fieldText;

}
