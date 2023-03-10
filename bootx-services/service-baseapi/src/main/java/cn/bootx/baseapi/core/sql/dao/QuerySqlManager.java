package cn.bootx.baseapi.core.sql.dao;

import cn.bootx.baseapi.core.sql.entity.QuerySql;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
 *
 * @author xxm
 * @date 2023/3/9
 */
@Slf4j
@Repository
public class QuerySqlManager extends BaseManager<QuerySqlMapper, QuerySql> {
}
