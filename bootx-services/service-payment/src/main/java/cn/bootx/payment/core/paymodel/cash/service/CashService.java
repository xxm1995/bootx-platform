package cn.bootx.payment.core.paymodel.cash.service;

import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.cash.dao.CashPaymentManager;
import cn.bootx.payment.core.paymodel.cash.entity.CashPayment;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * 现金支付
 * @author xxm
 * @date 2021/6/23
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CashService {
    private final CashPaymentManager cashPaymentManager;

    /**
     * 支付
     */
    public void pay(PayModeParam payMode, Payment payment, PayParam payParam) {
        CashPayment walletPayment = new CashPayment();
        walletPayment
                .setPaymentId(payment.getId())
                .setUserId(payment.getUserId())
                .setBusinessId(payParam.getBusinessId())
                .setAmount(payMode.getAmount())
                .setPayStatus(payment.getPayStatus());
        cashPaymentManager.save(walletPayment);
    }

    /**
     * 关闭
     */
    public void close(Long paymentId) {
        Optional<CashPayment> cashPaymentOpt = cashPaymentManager.findByPaymentId(paymentId);
        cashPaymentOpt.ifPresent(cashPayment -> {
            cashPayment.setPayStatus(PayStatusCode.TRADE_CANCEL);
            cashPaymentManager.updateById(cashPayment);
        });
    }
}
