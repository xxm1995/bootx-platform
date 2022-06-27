package cn.bootx.iam.core.client.convert;

import cn.bootx.iam.core.client.entity.Application;
import cn.bootx.iam.dto.client.ApplicationDto;
import cn.bootx.iam.param.client.ApplicationParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 认证应用
 * @author xxm
 * @date 2022-06-27
 */
@Mapper
public interface ApplicationConvert {
    ApplicationConvert CONVERT = Mappers.getMapper(ApplicationConvert.class);

    Application convert(ApplicationParam in);

    ApplicationDto convert(Application in);

}