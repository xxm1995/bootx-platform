package cn.bootx.iam.core.permission.convert;

import cn.bootx.iam.core.permission.entity.PermissionMenu;
import cn.bootx.iam.core.permission.entity.PermissionPath;
import cn.bootx.iam.dto.permission.PermissionMenuDto;
import cn.bootx.iam.dto.permission.PermissionPathDto;
import cn.bootx.iam.param.permission.PermissionMenuParam;
import cn.bootx.iam.param.permission.PermissionPathParam;
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
    PermissionPathDto convert(PermissionPath in);

    @Mappings({})
    PermissionPath convert(PermissionPathParam in);

    @Mappings({})
    PermissionPath convert(PermissionPathDto in);

    @Mappings({})
    PermissionMenu convert(PermissionMenuParam in);

    @Mappings({})
    PermissionMenuDto convert(PermissionMenu in);

}
