package cn.bootx.payment.core.paymodel.alipay.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.alipay.dao.AliPaymentManager;
import cn.bootx.payment.core.paymodel.alipay.entity.AliPayment;
import cn.bootx.payment.dto.payment.PayChannelInfo;
import cn.bootx.payment.dto.payment.RefundableInfo;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * 支付宝支付记录
 * @author xxm
 * @date 2021/2/26
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class AliPaymentService {
    private final AliPaymentManager aliPaymentManager;
    private final PaymentManager paymentManager;

    /**
     * 支付调起成功
     * 更新 payment 中 异步支付类型信息
     */
    public void updatePaySuccess(Payment payment, PayModeParam payModeParam){
        payment.setSyncPayMode(true)
                .setSyncPayWay(PayChannelCode.ALI);
        // TODO 设置超时时间

        List<PayChannelInfo> payTypeInfos = payment.getPayChannelInfoList();
        List<RefundableInfo> refundableInfos = payment.getRefundableInfoList();
        // 清除已有的异步支付类型信息
        payTypeInfos.removeIf(payTypeInfo -> PayChannelCode.SYNC_TYPE.contains(payTypeInfo.getPayChannel()));
        refundableInfos.removeIf(payTypeInfo -> PayChannelCode.SYNC_TYPE.contains(payTypeInfo.getPayChannel()));
        // 更新支付宝支付类型信息
        payTypeInfos.add(new PayChannelInfo()
                .setPayChannel(PayChannelCode.ALI)
                .setPayWay(payModeParam.getPayWay())
                .setAmount(payModeParam.getAmount())
                .setExtraParamsJson(payModeParam.getExtraParamsJson()));
        payment.setPayChannelInfo(JSONUtil.toJsonStr(payTypeInfos));
        // 更新支付宝可退款类型信息
        refundableInfos.add(new RefundableInfo()
                .setPayChannel(PayChannelCode.ALI)
                .setAmount(payModeParam.getAmount()));
        payment.setRefundableInfo(JSONUtil.toJsonStr(refundableInfos));
    }

    /**
     * 更新异步支付记录成功状态, 并创建支付宝支付记录
     */
    public void updateAsyncSuccess(Long id, PayModeParam payModeParam, String tradeNo) {

        // 更新支付记录
        Payment payment = paymentManager.findById(id)
                .orElseThrow(() -> new BizException("支付记录不存在"));

        // 创建支付宝支付记录
        AliPayment aliPayment = new AliPayment();
        aliPayment.setTradeNo(tradeNo)
                .setPaymentId(payment.getId())
                .setAmount(payModeParam.getAmount())
                .setBusinessId(payment.getBusinessId())
                .setUserId(payment.getUserId())
                .setPayStatus(PayStatusCode.TRADE_SUCCESS)
                .setPayTime(LocalDateTime.now());
        aliPaymentManager.save(aliPayment);
    }

    /**
     * 取消状态
     */
    public void updateClose(Long paymentId){
        Optional<AliPayment> aliPaymentOptional = aliPaymentManager.findByPaymentId(paymentId);
        aliPaymentOptional.ifPresent(aliPayment -> {
            aliPayment.setPayStatus(PayStatusCode.TRADE_CANCEL);
            aliPaymentManager.updateById(aliPayment);
        });
    }

    /**
     * 更新退款成功处理, 更新可退款信息
     */
    public void updateRefundSuccess(Payment payment){
        List<RefundableInfo> refundableInfos = payment.getRefundableInfoList();
        RefundableInfo refundableInfo = refundableInfos.stream()
                .filter(o -> o.getPayChannel() == PayChannelCode.ALI)
                .findFirst()
                .orElseThrow(() -> new BizException("数据不存在"));
        refundableInfos.remove(refundableInfo);

    }

}
