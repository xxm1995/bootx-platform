package cn.bootx.iam.core.role.convert;

import cn.bootx.iam.core.role.entity.Role;
import cn.bootx.iam.dto.role.RoleDto;
import cn.bootx.iam.param.role.RoleParam;
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
}
