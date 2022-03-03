package cn.bootx.payment.core.cashier.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.payment.code.pay.PayModelExtraCode;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.pay.PayModelUtil;
import cn.bootx.payment.core.pay.service.PayService;
import cn.bootx.payment.dto.pay.PayResult;
import cn.bootx.payment.exception.payment.PayFailureException;
import cn.bootx.payment.param.cashier.CashierSinglePayParam;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.util.DesensitizedUtil;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;

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
     * 发起支付(单渠道支付)
     */
    public PayResult singlePay(CashierSinglePayParam param){
        // 构建支付方式参数
        PayModeParam payModeParam = new PayModeParam()
                .setPayChannel(param.getPayChannel())
                .setPayWay(param.getPayWay())
                .setAmount(param.getAmount());
        // 判断是否可能是付款码支付
        if (StrUtil.isNotBlank(param.getAuthCode())){
            HashMap<String, String> map = new HashMap<>(1);
            map.put(PayModelExtraCode.AUTH_CODE,param.getAuthCode());
            String extraParamsJson = PayModelUtil.buildExtraParamsJson(param.getPayChannel(), map);
            payModeParam.setExtraParamsJson(extraParamsJson);
        }
        PayParam payParam = new PayParam()
                .setTitle(param.getTitle())
                .setBusinessId(param.getBusinessId())
                .setUserId(SecurityUtil.getCurrentUser().map(UserDetail::getId).orElse(DesensitizedUtil.userId()))
                .setPayModeList(Collections.singletonList(payModeParam));
        PayResult payResult = payService.pay(payParam);

        if (PayStatusCode.TRADE_SUCCESS == payResult.getPayStatus()){
            throw new PayFailureException("支付已经完成");
        }
        if (PayStatusCode.TRADE_REFUNDED == payResult.getPayStatus()){
            throw new PayFailureException("已经退款");
        }
        return payResult;
    }
}
