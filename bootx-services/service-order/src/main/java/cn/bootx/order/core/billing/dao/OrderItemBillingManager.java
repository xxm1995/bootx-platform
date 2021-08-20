package cn.bootx.order.core.billing.dao;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * 订单明细账单
 * @author xxm
 * @date 2020/12/11
 */
@Service
@RequiredArgsConstructor
public class OrderItemBillingManager {

    private final OrderItemBillingMapper orderItemBillingRepository;

}
