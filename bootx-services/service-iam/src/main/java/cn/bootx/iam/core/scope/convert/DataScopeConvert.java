package cn.bootx.iam.core.scope.convert;

import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**   
* 数据范围转换类
* @author xxm  
* @date 2021/12/23 
*/
@Mapper
public interface DataScopeConvert {
    DataScopeConvert CONVERT = Mappers.getMapper(DataScopeConvert.class);
}
