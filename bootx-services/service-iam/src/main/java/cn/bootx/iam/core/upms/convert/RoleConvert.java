package cn.bootx.iam.core.upms.convert;

import cn.bootx.iam.core.upms.entity.Role;
import cn.bootx.iam.dto.upms.RoleDto;
import cn.bootx.iam.param.upms.RoleParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

@Mapper
public interface RoleConvert {
    RoleConvert CONVERT = Mappers.getMapper(RoleConvert.class);

    @Mappings({})
    RoleDto convert(Role in);

    @Mappings({})
    Role convert(RoleParam in);

    @Mappings({})
    Role convert(RoleDto in);
}
