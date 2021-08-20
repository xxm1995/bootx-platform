package cn.bootx.order.core.order.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.order.core.order.entity.OrderStrategyMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* 订单策略映射
* @author xxm
* @date 2020/11/27
*/
@Repository
@RequiredArgsConstructor
public class OrderStrategyMappingManager extends BaseManager<OrderStrategyMappingMapper,OrderStrategyMapping> {

    public List<OrderStrategyMapping> findByOrder(Long orderId) {
        return findAllByField(OrderStrategyMapping::getOrderId,orderId);
    }
}
