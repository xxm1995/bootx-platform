package cn.bootx.iam.core.dept.convert;

import cn.bootx.iam.core.dept.entity.Dept;
import cn.bootx.iam.dto.dept.DeptDto;
import cn.bootx.iam.param.dept.DeptParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 部门机构转换
* @author xxm  
* @date 2021/8/4 
*/
@Mapper
public interface DeptConvert {
    DeptConvert CONVERT = Mappers.getMapper(DeptConvert.class);

    Dept convert(DeptDto in);

    Dept convert(DeptParam in);

    DeptDto convert(Dept in);
}
