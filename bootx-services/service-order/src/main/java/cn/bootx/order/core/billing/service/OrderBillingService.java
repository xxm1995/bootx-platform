package cn.bootx.order.core.billing.service;

import cn.bootx.order.core.billing.dao.OrderBillingManager;
import cn.bootx.order.core.billing.dao.OrderItemBillingManager;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/**
 * 账单服务
 * @author xxm
 * @date 2021/2/25
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class OrderBillingService {

    private final OrderBillingManager orderBillingManager;
    private final OrderItemBillingManager orderItemBillingManager;
    private final PaymentManager paymentManager;


    /**
     * billing 的拆分操作
     */
    @Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
    public void handleBilling(Long paymentId) {
    }
}
