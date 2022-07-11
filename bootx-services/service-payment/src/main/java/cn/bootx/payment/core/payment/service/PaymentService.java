package cn.bootx.payment.core.payment.service;

import cn.bootx.payment.code.pay.PayChannelEnum;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.dao.PaymentManager;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.dto.payment.RefundableInfo;
import cn.bootx.payment.exception.payment.PayFailureException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

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
     * 校验支付状态，支付成功则返回，支付失败则抛出对应的异常
     */
    public Payment getAndCheckPaymentByBusinessId(String businessId) {
        // 根据订单查询支付记录
        Payment payment = paymentManager.findByBusinessId(businessId)
                .orElse(null);
        if (Objects.nonNull(payment)) {
            // 支付失败
            List<Integer> trades = Arrays.asList(PayStatusCode.TRADE_FAIL, PayStatusCode.TRADE_CANCEL);
            if (trades.contains(payment.getPayStatus())) {
                throw new PayFailureException("支付失败或已经被撤销");
            }
            return payment;
        }
        return null;
    }

    /**
     * 退款成功处理, 更新可退款信息 不进行持久化
     */
    public void updateRefundSuccess(Payment payment, BigDecimal amount, PayChannelEnum payChannelEnum){
        // 删除旧有的退款记录, 替换退款完的新的
        List<RefundableInfo> refundableInfos = payment.getRefundableInfo();
        RefundableInfo refundableInfo = refundableInfos.stream()
                .filter(o -> o.getPayChannel() == payChannelEnum.getNo())
                .findFirst()
                .orElseThrow(() -> new PayFailureException("数据不存在"));
        refundableInfos.remove(refundableInfo);
        refundableInfo.setAmount(refundableInfo.getAmount().subtract(amount));
        refundableInfos.add(refundableInfo);
        payment.setRefundableInfo(refundableInfos);
    }

}
