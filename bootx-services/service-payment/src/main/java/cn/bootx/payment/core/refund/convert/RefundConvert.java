package cn.bootx.payment.core.refund.convert;

import cn.bootx.payment.core.pay.convert.PayConvert;
import cn.bootx.payment.dto.payment.RefundableInfo;
import cn.bootx.payment.param.pay.PayModeParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
*
* @author xxm
* @date 2022/3/2
*/
@Mapper
public interface RefundConvert {
    PayConvert CONVERT = Mappers.getMapper(PayConvert.class);

    RefundableInfo convert(PayModeParam in);

}
