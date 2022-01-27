package cn.bootx.starter.code.gen.dao;

import cn.bootx.starter.code.gen.entity.DatabaseColumn;
import cn.bootx.starter.code.gen.entity.DatabaseTable;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
*
* @author xxm
* @date 2022/1/27
*/
@Mapper
public interface DatabaseTableMapper {

    /**
     * 查询表信息
     */
    @Select("select table_name, engine, table_comment, create_time from information_schema.tables"
            + " where table_schema = (select database())")
    List<DatabaseTable> findAll();

    /**
     * 查询表信息
     */
    @Select("select table_name, engine, table_comment, create_time from information_schema.tables"
            + " where table_schema = (select database())")
    Page<DatabaseTable> page(Page<DatabaseTable> mpPage);

    @Select("select table_name, engine, table_comment, create_time from information_schema.tables"
            + "	where table_schema = (select database()) and table_name = #{tableName}")
    DatabaseTable findByTableName(@Param("tableName") String tableName);

    @Select("select column_name, data_type, column_comment, column_key, extra from information_schema.columns"
            + " where table_name = #{tableName} and table_schema = (select database()) order by ordinal_position")
    List<DatabaseColumn> findColumnByTableName(@Param("tableName") String tableName);
}
