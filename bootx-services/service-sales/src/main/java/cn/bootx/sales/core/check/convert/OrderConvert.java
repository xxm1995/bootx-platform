package cn.bootx.sales.core.check.convert;

import cn.bootx.sales.core.calculate.cache.OrderCache;
import cn.bootx.sales.core.calculate.cache.OrderDetailCache;
import cn.bootx.sales.param.order.OrderCheckParam;
import cn.bootx.sales.param.order.OrderDetailCheckParam;
import org.mapstruct.Mapper;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

/**   
* 订单转换
* @author xxm  
* @date 2021/5/19 
*/
@Mapper
public interface OrderConvert {
    OrderConvert INSTANCE = Mappers.getMapper(OrderConvert.class);

    OrderDetailCheckParam convert(OrderDetailCache in);

    OrderCheckParam convert(OrderCache in);
}
