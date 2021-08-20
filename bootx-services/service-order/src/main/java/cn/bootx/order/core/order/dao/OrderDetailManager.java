package cn.bootx.order.core.order.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.order.core.order.entity.OrderDetail;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* 订单明细
* @author xxm
* @date 2020/11/18
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderDetailManager extends BaseManager<OrderDetailMapper,OrderDetail> {

    public List<OrderDetail> findByOrder(Long orderId){
        return findAllByField(OrderDetail::getOrderId,orderId);
    }

    /**
     * 获取订单中的sku列表
     */
    public List<OrderDetail> findOrderSkuIds(Long orderId){
        return lambdaQuery().eq(OrderDetail::getOrderId,orderId)
                .select(OrderDetail::getSkuId)
                .list();
    }
}
