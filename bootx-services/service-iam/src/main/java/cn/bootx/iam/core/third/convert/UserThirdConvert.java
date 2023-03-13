package cn.bootx.iam.core.third.convert;

import cn.bootx.iam.core.third.entity.UserThird;
import cn.bootx.iam.dto.user.UserThirdDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserThirdConvert {

    UserThirdConvert CONVERT = Mappers.getMapper(UserThirdConvert.class);

    UserThirdDto convert(UserThird in);

}
