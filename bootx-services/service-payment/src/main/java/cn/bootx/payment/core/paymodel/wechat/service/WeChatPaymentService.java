package cn.bootx.payment.core.paymodel.wechat.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.wechat.dao.WeChatPaymentManager;
import cn.bootx.payment.core.paymodel.wechat.entity.WeChatPayment;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * 微信支付记录单
 * @author xxm
 * @date 2021/6/21
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WeChatPaymentService {
    private final PaymentManager paymentManager;
    private final WeChatPaymentManager weChatPaymentManager;

    /**
     * 支付调起成功
     * 更新 payment 中 异步支付类型信息
     */
    public void updatePaySuccess(Payment payment, PayModeParam payModeParam){
        payment.setSyncPayMode(true)
                .setSyncPayTypeCode(PayChannelCode.WECHAT);

        List<PayChannelInfo> payTypeInfos = payment.getPayTypeInfos();
        // 清除已有的异步支付类型信息
        payTypeInfos.removeIf(payTypeInfo -> PayChannelCode.SYNC_TYPE.contains(payTypeInfo.getPayChannel()));
        // 添加微信支付类型信息
        payTypeInfos.add(new PayChannelInfo()
                .setPayChannel(PayChannelCode.WECHAT)
                .setPayWay(payModeParam.getPayWay())
                .setAmount(payModeParam.getAmount())
                .setExtraParamsJson(payModeParam.getExtraParamsJson()));
        payment.setPayChannelInfo(JSONUtil.toJsonStr(payTypeInfos));
        paymentManager.updateById(payment);
    }

    /**
     * 更新支付记录成功状态, 并创建支付宝支付记录
     */
    public void updateSyncSuccess(Long id, PayModeParam payModeParam, String tradeNo) {
        // 更新支付记录
        Payment payment = paymentManager.findById(id)
                .orElseThrow(() -> new BizException("支付记录不存在"));

        // 创建支付宝支付记录
        WeChatPayment wechatPayment = new WeChatPayment();
        wechatPayment.setTradeNo(tradeNo)
                .setPaymentId(payment.getId())
                .setAmount(payModeParam.getAmount())
                .setBusinessId(payment.getBusinessId())
                .setUserId(payment.getUserId())
                .setPayStatus(PayStatusCode.TRADE_SUCCESS)
                .setPayTime(LocalDateTime.now());
        weChatPaymentManager.updateById(wechatPayment);
    }

    /**
     * 取消状态
     */
    public void updateClose(Long paymentId){
        Optional<WeChatPayment> weChatPaymentOptional = weChatPaymentManager.findByPaymentId(paymentId);
        weChatPaymentOptional.ifPresent(weChatPayment -> {
            weChatPayment.setPayStatus(PayStatusCode.TRADE_CANCEL);
            weChatPaymentManager.updateById(weChatPayment);
        });
    }
}
