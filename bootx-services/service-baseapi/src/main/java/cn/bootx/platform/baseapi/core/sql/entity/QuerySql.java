package cn.bootx.platform.baseapi.core.sql.entity;

import cn.bootx.platform.baseapi.core.sql.convert.QuerySqlConvert;
import cn.bootx.platform.baseapi.dto.sql.QuerySqlDto;
import cn.bootx.platform.common.core.annotation.BigField;
import cn.bootx.platform.common.core.function.EntityBaseFunction;
import cn.bootx.platform.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.platform.common.mybatisplus.handler.JacksonRawTypeHandler;
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
@TableName(value = "base_query_sql", autoResultMap = true)
public class QuerySql extends MpBaseEntity implements EntityBaseFunction<QuerySqlDto> {

    /** 数据源ID */
    private Long databaseId;

    /** 名称 */
    private String name;

    /** 是否集合 */
    private Boolean isList;

    /** sql语句 */
    @BigField
    private String sql;

    /** SQL查询参数 */
    @BigField
    @TableField(typeHandler = JacksonRawTypeHandler.class)
    private List<SqlParam> params;

    /** SQL查询结果字段 */
    @BigField
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
