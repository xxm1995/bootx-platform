package cn.bootx.order.core.order.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtils;
import cn.bootx.order.code.OrderStatusCode;
import cn.bootx.order.core.order.entity.Order;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 订单
 * @author xxm
 * @date 2020/11/18
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderManager extends BaseManager<OrderMapper,Order> {

    public List<Order> findByUser(Long id) {
        return findAllByField(Order::getUserId,id);
    }

    public Page<Order> page(PageParam pageParam) {
        Page<Order> mpPage = MpUtils.getMpPage(pageParam, Order.class);
        return lambdaQuery().page(mpPage);
    }

    /**
     * 获取超时订单的id集合
     */
    public List<Order> findPayTimeoutOrderIdsByType(LocalDateTime date, Integer type) {
        // select id from Order where state = ?1 and createTime < ?2 and businessId = ?3
        return lambdaQuery().eq(Order::getStatus,OrderStatusCode.STATUS_NORMAL)
                .le(MpBaseEntity::getCreateTime,date)
                .eq(Order::getType,type)
                .list();
    }
}
