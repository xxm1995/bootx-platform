package cn.bootx.platform.iam.convert.third;

import cn.bootx.platform.iam.entity.third.UserThird;
import cn.bootx.platform.iam.result.third.UserThirdDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

@Mapper
public interface UserThirdConvert {

    UserThirdConvert CONVERT = Mappers.getMapper(UserThirdConvert.class);

    UserThirdDto convert(UserThird in);

}
