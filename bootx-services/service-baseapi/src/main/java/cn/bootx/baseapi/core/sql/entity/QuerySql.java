package cn.bootx.baseapi.core.sql.entity;

import cn.bootx.common.core.annotation.actable.Column;
import cn.bootx.common.core.annotation.actable.Table;
import cn.bootx.common.core.code.actable.MySqlFieldType;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.handler.JacksonRawTypeHandler;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * SQL查询语句
 * @author xxm
 * @date 2023/3/9
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Table(comment = "SQL查询语句")
@TableName(value = "base_query_sql",autoResultMap = true)
public class QuerySql extends MpBaseEntity {

    /** 数据源ID */
    @Column(comment = "数据源ID")
    private Long databaseId;

    /** 数据源编码 */
    @Column(comment = "数据源编码")
    private String databaseCode;

    /** 名称 */
    @Column(comment = "名称")
    private String name;

    /** sql语句 */
    @Column(comment = "sql语句",type = MySqlFieldType.TEXT)
    private String sql;

    /** 是否集合 */
    @Column(comment = "是否集合")
    private Boolean isList;

    /** 是否分页 */
    @Column(comment = "是否分页")
    private Boolean isPage;


    /** SQL查询参数 */
    @Column(comment = "SQL查询参数",type = MySqlFieldType.LONGTEXT)
    @TableField(typeHandler = JacksonRawTypeHandler.class)
    private List<SqlParam> params;

    /** SQL查询结果字段 */
    @Column(comment = "SQL查询结果字段",type = MySqlFieldType.LONGTEXT)
    @TableField(typeHandler = JacksonRawTypeHandler.class)
    private List<SqlField> fields;


    /**
     * SQL查询参数
     */
    @Getter
    @Setter
    public static class SqlParam {
        /** 参数名称 */
        private String name;
        /**
         * 类型
         * @see cn.bootx.baseapi.code.QuerySqlCode
         */
        private String type;
    }

    /**
     * SQL查询结果字段
     */
    @Getter
    @Setter
    public static class SqlField {
        /** 字段名 */
        private String fieldName;

        /** 显示名称 */
        private String fieldText;
    }

}
