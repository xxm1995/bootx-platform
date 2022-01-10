package cn.bootx.baseapi.core.config.convert;

import cn.bootx.baseapi.core.config.entity.SystemParameter;
import cn.bootx.baseapi.dto.system.SystemParameterDto;
import cn.bootx.baseapi.param.system.SystemParameterParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 系统参数和系统配置实体类转换
* @author xxm  
* @date 2021/10/25 
*/
@Mapper
public interface SystemConvert {
    SystemConvert CONVERT = Mappers.getMapper(SystemConvert.class);

    SystemParameterDto convert(SystemParameter in);

    SystemParameter convert(SystemParameterParam in);

}
