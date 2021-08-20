package cn.bootx.order.core.order.dao;

import cn.bootx.order.core.order.entity.OrderDetail;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 订单明细
* @author xxm  
* @date 2020/11/18 
*/
@Mapper
public interface OrderDetailMapper extends BaseMapper<OrderDetail> {
}
