package cn.bootx.platform.baseapi.core.dataresult.convert;

import cn.bootx.platform.baseapi.core.dataresult.entity.QuerySql;
import cn.bootx.platform.baseapi.dto.dataresult.QuerySqlDto;
import cn.bootx.platform.baseapi.param.sql.QuerySqlParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author xxm
 * @since 2023/3/13
 */
@Mapper
public interface QuerySqlConvert {

    QuerySqlConvert CONVERT = Mappers.getMapper(QuerySqlConvert.class);

    QuerySqlDto convert(QuerySql in);

    QuerySql convert(QuerySqlParam in);

}
