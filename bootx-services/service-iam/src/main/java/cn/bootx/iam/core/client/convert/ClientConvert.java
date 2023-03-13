package cn.bootx.iam.core.client.convert;

import cn.bootx.iam.core.client.entity.Client;
import cn.bootx.iam.dto.client.ClientDto;
import cn.bootx.iam.param.client.ClientParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 认证应用
 *
 * @author xxm
 * @date 2022-06-27
 */
@Mapper
public interface ClientConvert {

    ClientConvert CONVERT = Mappers.getMapper(ClientConvert.class);

    Client convert(ClientParam in);

    ClientDto convert(Client in);

}