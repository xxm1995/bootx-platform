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

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;
import java.util.Optional;

import static cn.bootx.payment.code.pay.PayStatusCode.TRADE_PROGRESS;

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
     * 保存
     */
    public Payment save(Payment payment){
        return paymentManager.save(payment);
    }

    /**
     * 更新支付记录
     */
    public Payment updateById(Payment payment) {
        // 超时注册
        this.registerExpiredTime(payment);
        return paymentManager.updateById(payment);
    }

    /**
     * 根据id查询
     */
    public Optional<Payment> findById(Serializable id) {
        return paymentManager.findById(id);
    }

    /**
     * 根据BusinessId查询
     */
    public Optional<Payment> findByBusinessId(String businessId){
        return paymentManager.findByBusinessId(businessId);
    }

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

    /**
     * 支付单超时关闭事件注册
     */
    public void registerExpiredTime(Payment payment){
        LocalDateTime expiredTime = payment.getExpiredTime();
        if (Objects.equals(payment.getPayStatus(),TRADE_PROGRESS)&&Objects.nonNull(expiredTime)){
            try {

            } catch (Exception e){
                log.error("注册支付单超时关闭失败");
            }
        }
    }

}
