package cn.bootx.platform.baseapi.core.sql.entity;

import cn.bootx.platform.baseapi.core.sql.convert.QuerySqlConvert;
import cn.bootx.platform.baseapi.dto.sql.QuerySqlDto;
import cn.bootx.platform.common.core.annotation.BigField;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.handler.JacksonRawTypeHandler;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.mybatis.table.modify.annotation.DbColumn;
import cn.bootx.mybatis.table.modify.annotation.DbTable;
import cn.bootx.mybatis.table.modify.impl.mysql.annotation.MySqlFieldType;
import cn.bootx.mybatis.table.modify.impl.mysql.constants.MySqlFieldTypeEnum;
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
@DbTable(comment = "SQL查询语句")
@TableName(value = "base_query_sql", autoResultMap = true)
public class QuerySql extends MpBaseEntity implements EntityBaseFunction<QuerySqlDto> {

    /** 数据源ID */
    @DbColumn(comment = "数据源ID")
    private Long databaseId;

    /** 名称 */
    @DbColumn(comment = "名称")
    private String name;

    /** 是否集合 */
    @DbColumn(comment = "是否集合")
    private Boolean isList;

    /** sql语句 */
    @BigField
    @DbColumn(comment = "sql语句")
    @MySqlFieldType(MySqlFieldTypeEnum.TEXT)
    private String sql;

    /** SQL查询参数 */
    @BigField
    @DbColumn(comment = "SQL查询参数")
    @MySqlFieldType(MySqlFieldTypeEnum.TEXT)
    @TableField(typeHandler = JacksonRawTypeHandler.class)
    private List<SqlParam> params;

    /** SQL查询结果字段 */
    @BigField
    @DbColumn(comment = "SQL查询结果字段")
    @MySqlFieldType(MySqlFieldTypeEnum.TEXT)
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
