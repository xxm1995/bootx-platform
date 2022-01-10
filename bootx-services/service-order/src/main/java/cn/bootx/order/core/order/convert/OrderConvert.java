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
    OrderDto convert(Order in);

    Order convert(OrderDto in);

    OrderDetailDto convert(OrderDetail in);

    OrderDetail convert(OrderDetailDto in);

    OrderDetail convert(OrderDetailParam in);

    OrderStrategyMappingDto convert(OrderStrategyMapping in);

    OrderStrategyMapping convert(OrderStrategyMappingDto in);

}
