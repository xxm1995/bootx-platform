package cn.bootx.iam.core.permission.convert;

import cn.bootx.iam.core.permission.entity.PermMenu;
import cn.bootx.iam.core.permission.entity.PermPath;
import cn.bootx.iam.core.permission.entity.RequestPath;
import cn.bootx.iam.dto.permission.PermMenuDto;
import cn.bootx.iam.dto.permission.PermPathDto;
import cn.bootx.iam.param.permission.PermMenuParam;
import cn.bootx.iam.param.permission.PermPathParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 权限转换
* @author xxm
* @date 2021/8/3
*/
@Mapper
public interface PermConvert {
    PermConvert CONVERT = Mappers.getMapper(PermConvert.class);

    @Mappings({})
    PermPathDto convert(PermPath in);

    @Mappings({})
    PermPath convert(PermPathParam in);

    @Mappings({})
    PermPath convert(PermPathDto in);

    @Mappings({})
    PermPath convert(RequestPath in);

    @Mappings({})
    PermMenu convert(PermMenuParam in);

    @Mappings({})
    PermMenuDto convert(PermMenu in);

}
