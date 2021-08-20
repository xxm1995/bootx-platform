package cn.bootx.iam.core.upms.convert;

import cn.bootx.iam.core.upms.entity.Permission;
import cn.bootx.iam.dto.upms.PermissionDto;
import cn.bootx.iam.param.upms.PermissionParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 权限转换
* @author xxm
* @date 2021/8/3
*/
@Mapper
public interface PermissionConvert {
    PermissionConvert CONVERT = Mappers.getMapper(PermissionConvert.class);

    @Mappings({})
    PermissionDto convert(Permission in);

    @Mappings({})
    Permission convert(PermissionParam in);

    @Mappings({})
    Permission convert(PermissionDto in);

}
