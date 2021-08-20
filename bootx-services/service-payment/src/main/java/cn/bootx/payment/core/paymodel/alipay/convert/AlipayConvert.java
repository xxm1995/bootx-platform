package cn.bootx.payment.core.paymodel.alipay.convert;

import cn.bootx.payment.core.paymodel.alipay.entity.AlipayConfig;
import cn.bootx.payment.dto.paymodel.alipay.AlipayConfigDto;
import cn.bootx.payment.param.paymodel.alipay.AlipayConfigParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 支付宝转换
* @author xxm
* @date 2021/7/5
*/
@Mapper
public interface AlipayConvert {
    AlipayConvert CONVERT = Mappers.getMapper(AlipayConvert.class);
    @Mappings({})
    AlipayConfig convert(AlipayConfigDto in);

    @Mappings({})
    AlipayConfig convert(AlipayConfigParam in);

    @Mappings({})
    AlipayConfigDto convert(AlipayConfig in);
}
