package cn.bootx.payment.core.cashier.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.payment.core.cashier.entity.CashierPay;
import cn.bootx.payment.code.pay.PayChannelEnum;
import cn.bootx.payment.core.pay.service.PayService;
import cn.bootx.payment.dto.pay.PayResult;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;

/**
 * 结算台
 * @author xxm
 * @date 2022/2/23
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class CashierService {
    private final PayService payService;

    /**
     * 发起支付
     */
    public String pay(CashierPay cashierPay){
        // 构建支付参数
        PayModeParam payModeParam = new PayModeParam()
                .setPayChannel(PayChannelEnum.findByNo(cashierPay.getPayChannel()).getNo())
                .setPayWay(cashierPay.getPayWay())
                .setAmount(cashierPay.getAmount());

        PayParam payParam = new PayParam()
                .setTitle(cashierPay.getTitle())
                .setBusinessId(cashierPay.getBusinessId())
                .setUserId(SecurityUtil.getCurrentUser().map(UserDetail::getId).orElse(0L))
                .setPayModeList(Collections.singletonList(payModeParam));

        PayResult pay = payService.pay(payParam);
        return pay.getSyncPayInfo().getPayBody();
    }
}
