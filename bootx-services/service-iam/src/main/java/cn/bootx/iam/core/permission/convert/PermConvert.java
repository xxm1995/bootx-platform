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

    PermPathDto convert(PermPath in);

    PermPath convert(PermPathParam in);

    PermPath convert(PermPathDto in);

    PermPath convert(RequestPath in);

    PermMenu convert(PermMenuParam in);

    PermMenuDto convert(PermMenu in);

}
