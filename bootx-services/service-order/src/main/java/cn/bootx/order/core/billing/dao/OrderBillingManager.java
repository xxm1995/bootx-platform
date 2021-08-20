package cn.bootx.order.core.billing.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.order.core.billing.entity.OrderBilling;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class OrderBillingManager extends BaseManager<OrderBillingMapper, OrderBilling> {

}
