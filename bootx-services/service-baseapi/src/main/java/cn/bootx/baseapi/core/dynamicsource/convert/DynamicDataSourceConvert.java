package cn.bootx.baseapi.core.dynamicsource.convert;

import cn.bootx.baseapi.core.dynamicsource.entity.DynamicDataSource;
import cn.bootx.baseapi.dto.dynamicsource.DynamicDataSourceDto;
import cn.bootx.baseapi.param.dynamicsource.DynamicDataSourceParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 动态数据源管理
 * @author xxm
 * @date 2022-09-24
 */
@Mapper
public interface DynamicDataSourceConvert {
    DynamicDataSourceConvert CONVERT = Mappers.getMapper(DynamicDataSourceConvert.class);

    DynamicDataSource convert(DynamicDataSourceParam in);

    DynamicDataSourceDto convert(DynamicDataSource in);

}