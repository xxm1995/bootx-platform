package cn.bootx.payment.core.cashier.service;

import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayModelExtraCode;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.aggregate.service.AggregateService;
import cn.bootx.payment.core.pay.PayModelUtil;
import cn.bootx.payment.core.pay.service.PayService;
import cn.bootx.payment.dto.pay.PayResult;
import cn.bootx.payment.exception.payment.PayFailureException;
import cn.bootx.payment.param.cashier.CashierCombinationPayParam;
import cn.bootx.payment.param.cashier.CashierSinglePayParam;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.collection.CollUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Objects;

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
    private final AggregateService aggregateService;



    /**
     * 发起支付(单渠道支付)
     */
    public PayResult singlePay(CashierSinglePayParam param){

        // 如果是聚合支付, 特殊处理
        if (Objects.equals(PayChannelCode.AGGREGATION,param.getPayChannel())){
            int payChannel = aggregateService.getPayChannel(param.getAuthCode());
            param.setPayChannel(payChannel);
        }
        // 构建支付方式参数
        PayModeParam payModeParam = new PayModeParam()
                .setPayChannel(param.getPayChannel())
                .setPayWay(param.getPayWay())
                .setAmount(param.getAmount());

        // 处理附加参数
        HashMap<String, String> map = new HashMap<>(1);
        map.put(PayModelExtraCode.AUTH_CODE,param.getAuthCode());
        map.put(PayModelExtraCode.VOUCHER_NO,param.getVoucherNo());
        String extraParamsJson = PayModelUtil.buildExtraParamsJson(param.getPayChannel(), map);
        payModeParam.setExtraParamsJson(extraParamsJson);

        PayParam payParam = new PayParam()
                .setTitle(param.getTitle())
                .setBusinessId(param.getBusinessId())
                .setUserId(SecurityUtil.getUserIdOrDefaultId())
                .setPayModeList(Collections.singletonList(payModeParam));
        PayResult payResult = payService.pay(payParam);

        if (PayStatusCode.TRADE_REFUNDED == payResult.getPayStatus()){
            throw new PayFailureException("已经退款");
        }
        return payResult;
    }

    /**
     * 组合支付
     */
    public PayResult combinationPay(CashierCombinationPayParam param){
        // 处理支付参数
        List<PayModeParam> payModeList = param.getPayModeList();
        // 删除小于等于零的
        payModeList.removeIf(payModeParam -> BigDecimalUtil.compareTo(payModeParam.getAmount(), BigDecimal.ZERO)<1);
        if (CollUtil.isEmpty(payModeList)){
            throw new PayFailureException("支付参数有误");
        }
        // 发起支付
        PayParam payParam = new PayParam()
                .setTitle(param.getTitle())
                .setBusinessId(param.getBusinessId())
                .setUserId(SecurityUtil.getUserIdOrDefaultId())
                .setPayModeList(param.getPayModeList());
        PayResult payResult = payService.pay(payParam);

        if (PayStatusCode.TRADE_REFUNDED == payResult.getPayStatus()){
            throw new PayFailureException("已经退款");
        }
        return payResult;
    }
}
