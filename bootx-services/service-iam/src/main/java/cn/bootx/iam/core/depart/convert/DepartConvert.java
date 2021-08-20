package cn.bootx.iam.core.depart.convert;

import cn.bootx.iam.core.depart.entity.Depart;
import cn.bootx.iam.dto.depart.DepartDto;
import cn.bootx.iam.param.depart.DepartParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 部门机构转换
* @author xxm  
* @date 2021/8/4 
*/
@Mapper
public interface DepartConvert {
    DepartConvert CONVERT = Mappers.getMapper(DepartConvert.class);

    @Mappings({})
    Depart convert(DepartDto in);

    @Mappings({})
    Depart convert(DepartParam in);

    @Mappings({})
    DepartDto convert(Depart in);
}
