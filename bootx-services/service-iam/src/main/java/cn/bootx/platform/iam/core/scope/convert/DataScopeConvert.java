package cn.bootx.platform.iam.core.scope.convert;

import cn.bootx.platform.iam.param.scope.DataScopeParam;
import cn.bootx.platform.iam.core.scope.entity.DataScope;
import cn.bootx.platform.iam.dto.scope.DataScopeDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 数据范围转换类
 *
 * @author xxm
 * @date 2021/12/23
 */
@Mapper
public interface DataScopeConvert {

    DataScopeConvert CONVERT = Mappers.getMapper(DataScopeConvert.class);

    DataScope convert(DataScopeParam in);

    DataScopeDto convert(DataScope in);

}
