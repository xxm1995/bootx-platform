package cn.bootx.platform.baseapi.core.dataresult.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 查询语句
 * @author xxm
 * @since 2023/8/29
 */
@Mapper
public interface SqlQueryMapper {

    List<Map<String,Object>> query(@Param("sql") String sql);
}
