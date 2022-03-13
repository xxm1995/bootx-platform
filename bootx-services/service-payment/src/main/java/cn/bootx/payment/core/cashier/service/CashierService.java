package cn.bootx.payment.core.cashier.service;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.exception.BizException;
import cn.bootx.common.redis.RedisClient;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayModelExtraCode;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.code.pay.PayWayCode;
import cn.bootx.payment.core.aggregate.entity.AggregatePayInfo;
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
import cn.hutool.core.util.DesensitizedUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Objects;
import java.util.Optional;

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
    private final RedisClient redisClient;
    private final String PREFIX_KEY = "cashier:pay:aggregate:";



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

        if (PayStatusCode.TRADE_REFUNDED == payResult.getPayStatus()){
            throw new PayFailureException("已经退款");
        }
        return payResult;
    }


    /**
     * 扫码发起自动支付
     */
    public String aggregatePay(String key, String ua){
        CashierSinglePayParam cashierSinglePayParam = new CashierSinglePayParam()
                .setPayWay(PayWayCode.QRCODE);
        // 判断是哪种支付方式
        if (ua.contains(PayChannelCode.UA_ALI_PAY)) {
            cashierSinglePayParam.setPayChannel(PayChannelCode.ALI);
        }
        else if (ua.contains(PayChannelCode.UA_WECHAT_PAY)) {
            cashierSinglePayParam.setPayChannel(PayChannelCode.WECHAT);
        } else {
            throw new BizException("不支持的支付方式");
        }
        String jsonStr = Optional.ofNullable(redisClient.get(PREFIX_KEY + key))
                .orElseThrow(() -> new BizException("支付超时"));
        AggregatePayInfo aggregatePayInfo = JSONUtil.toBean(jsonStr, AggregatePayInfo.class);
        cashierSinglePayParam.setTitle(aggregatePayInfo.getTitle())
                .setAmount(aggregatePayInfo.getAmount())
                .setBusinessId(aggregatePayInfo.getBusinessId());
        PayResult payResult = this.singlePay(cashierSinglePayParam);
        return payResult.getSyncPayInfo().getPayBody();
    }

    /**
     * 组合支付
     */
    public PayResult combinationPay(CashierCombinationPayParam param){
        Long userId = SecurityUtil.getUserId();
        // 处理支付参数

        // 发起支付
        PayParam payParam = new PayParam()
                .setTitle(param.getTitle())
                .setUserId(userId)
                .setBusinessId(param.getBusinessId())
                .setUserId(SecurityUtil.getCurrentUser().map(UserDetail::getId).orElse(DesensitizedUtil.userId()))
                .setPayModeList(param.getPayModeList());
        PayResult payResult = payService.pay(payParam);

        if (PayStatusCode.TRADE_REFUNDED == payResult.getPayStatus()){
            throw new PayFailureException("已经退款");
        }
        return payResult;
    }
}
