package cn.bootx.payment.core.payment.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayChannelEnum;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.dto.payment.RefundableInfo;
import cn.bootx.payment.exception.payment.PayIsProcessingException;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.json.JSONUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**   
* 支付记录
* @author xxm  
* @date 2021/3/8 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class PaymentService {
    private final PaymentManager paymentManager;

    /**
     * 校验支付状态，支付成功则返回，支付失败/支付进行中则抛出对应的异常
     */
    public Payment getAndCheckPaymentByBusinessId(String businessId) {

        // 根据订单查询支付记录
        List<Payment> payments = paymentManager.findByBusinessIdNoCancelDesc(businessId);
        if (!CollectionUtil.isEmpty(payments)) {
            Payment  payment = payments.get(0);

            // 成功 或 异步支付
            if (payment.getPayStatus() == PayStatusCode.TRADE_SUCCESS || payment.isSyncPayMode()) {
                return payment;
            }

            // 支付中 (非异步支付方式下)
            if (payment.getPayStatus() == PayStatusCode.TRADE_PROGRESS) {
                throw new PayIsProcessingException();
            }
        }
        return null;
    }


    /**
     * 退款成功处理, 更新可退款信息
     */
    public void updateRefundSuccess(Payment payment, BigDecimal amount, PayChannelEnum payChannelEnum){
        // 删除旧有的退款记录, 替换退款完的新的
        List<RefundableInfo> refundableInfos = payment.getRefundableInfoList();
        RefundableInfo refundableInfo = refundableInfos.stream()
                .filter(o -> o.getPayChannel() == payChannelEnum.getNo())
                .findFirst()
                .orElseThrow(() -> new BizException("数据不存在"));
        refundableInfos.remove(refundableInfo);
        refundableInfo.setAmount(refundableInfo.getAmount().subtract(amount));
        refundableInfos.add(refundableInfo);
        payment.setRefundableInfo(JSONUtil.toJsonStr(refundableInfos));
    }

}
