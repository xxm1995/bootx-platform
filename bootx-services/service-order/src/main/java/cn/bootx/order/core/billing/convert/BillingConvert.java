package cn.bootx.order.core.billing.convert;

import cn.bootx.order.core.billing.entity.OrderBilling;
import cn.bootx.order.core.billing.entity.OrderItemBilling;
import cn.bootx.order.dto.billing.OrderBillingDto;
import cn.bootx.order.dto.billing.OrderItemBillingDto;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**
* 账单转换
* @author xxm
* @date 2021/6/28
*/
@Mapper
public interface BillingConvert {
    BillingConvert CONVERT = Mappers.getMapper(BillingConvert.class);

    @Mappings({})
    OrderBillingDto convert(OrderBilling in);

    @Mappings({})
    OrderItemBillingDto convert(OrderItemBilling in);


}
