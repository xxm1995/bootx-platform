package cn.bootx.order.core.order.convert;

import cn.bootx.order.core.order.entity.Order;
import cn.bootx.order.core.order.entity.OrderDetail;
import cn.bootx.order.core.order.entity.OrderStrategyMapping;
import cn.bootx.order.dto.order.OrderDetailDto;
import cn.bootx.order.dto.order.OrderDto;
import cn.bootx.order.dto.order.OrderStrategyMappingDto;
import cn.bootx.order.param.order.OrderDetailParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 订单转换
* @author xxm  
* @date 2021/8/11 
*/
@Mapper
public interface OrderConvert {
    OrderConvert CONVERT = Mappers.getMapper(OrderConvert.class);
    @Mappings({})
    OrderDto convert(Order in);

    @Mappings({})
    Order convert(OrderDto in);

    @Mappings({})
    OrderDetailDto convert(OrderDetail in);

    @Mappings({})
    OrderDetail convert(OrderDetailDto in);

    @Mappings({})
    OrderDetail convert(OrderDetailParam in);

    @Mappings({})
    OrderStrategyMappingDto convert(OrderStrategyMapping in);

    @Mappings({})
    OrderStrategyMapping convert(OrderStrategyMappingDto in);

}
