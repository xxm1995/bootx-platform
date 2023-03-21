package cn.bootx.baseapi.core.sql.entity;

import cn.bootx.baseapi.core.sql.convert.QuerySqlConvert;
import cn.bootx.baseapi.dto.sql.QuerySqlDto;
import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.annotation.actable.Column;
import cn.bootx.common.core.annotation.actable.Table;
import cn.bootx.common.core.code.actable.MySqlFieldType;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.handler.JacksonRawTypeHandler;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * SQL查询语句
 *
 * @author xxm
 * @date 2023/3/9
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Table(comment = "SQL查询语句")
@TableName(value = "base_query_sql", autoResultMap = true)
public class QuerySql extends MpBaseEntity implements EntityBaseFunction<QuerySqlDto> {

    /** 数据源ID */
    @Column(comment = "数据源ID")
    private Long databaseId;

    /** 名称 */
    @Column(comment = "名称")
    private String name;

    /** 是否集合 */
    @Column(comment = "是否集合")
    private Boolean isList;

    /** sql语句 */
    @BigField
    @Column(comment = "sql语句", type = MySqlFieldType.TEXT)
    private String sql;

    /** SQL查询参数 */
    @BigField
    @Column(comment = "SQL查询参数", type = MySqlFieldType.LONGTEXT)
    @TableField(typeHandler = JacksonRawTypeHandler.class)
    private List<SqlParam> params;

    /** SQL查询结果字段 */
    @BigField
    @Column(comment = "SQL查询结果字段", type = MySqlFieldType.LONGTEXT)
    @TableField(typeHandler = JacksonRawTypeHandler.class)
    private List<SqlField> fields;

    /**
     * 转换
     */
    @Override
    public QuerySqlDto toDto() {
        return QuerySqlConvert.CONVERT.convert(this);
    }

}
