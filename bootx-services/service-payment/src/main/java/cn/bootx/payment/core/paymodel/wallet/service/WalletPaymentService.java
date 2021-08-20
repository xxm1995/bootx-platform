package cn.bootx.payment.core.paymodel.wallet.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletPaymentManager;
import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import cn.bootx.payment.core.paymodel.wallet.entity.WalletPayment;
import cn.bootx.payment.dto.paymodel.wallet.WalletPaymentDto;
import cn.bootx.payment.param.pay.PayModeParam;
import cn.bootx.payment.param.pay.PayParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Optional;

/**
 * 钱包交易记录的相关操作
 * @author xxm
 * @date 2020/12/8
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WalletPaymentService {
    private final WalletService walletService;
    private final WalletPaymentManager walletPaymentManager;

    /**
     * 保存钱包支付记录
     */
    public void savePayment(Payment payment, PayParam payParam, PayModeParam payMode, Wallet wallet) {
        WalletPayment walletPayment = new WalletPayment()
                .setWalletId(wallet.getId());
        walletPayment.setPaymentId(payment.getId())
                .setUserId(payment.getUserId())
                .setBusinessId(payParam.getBusinessId())
                .setAmount(payMode.getAmount())
                .setPayStatus(payment.getPayStatus());
        walletPaymentManager.save(walletPayment);
    }

    /**
     * 更新错误状态
     */
    public void updateError(Long paymentId){
        Optional<WalletPayment> payment = walletPaymentManager.findByPaymentId(paymentId);
        if (payment.isPresent()){
            WalletPayment walletPayment = payment.get();
            walletPayment.setPayStatus(PayStatusCode.TRADE_FAIL);
            walletPaymentManager.updateById(walletPayment);
        }
    }
    /**
     * 更新成功状态
     */
    public void updateSuccess(Long paymentId){
        Optional<WalletPayment> payment = walletPaymentManager.findByPaymentId(paymentId);
        if (payment.isPresent()){
            WalletPayment walletPayment = payment.get();
            walletPayment.setPayStatus(PayStatusCode.TRADE_SUCCESS)
                    .setPayTime(LocalDateTime.now());
            walletPaymentManager.updateById(walletPayment);
        }
    }

    /**
     * 查询交易记录
     * @param paymentId 交易ID
     */
    public WalletPaymentDto getByPaymentId(Long paymentId){
        return walletPaymentManager.findByPaymentId(paymentId)
                .map(WalletPayment::toDto)
                .orElse(null);
    }

    /**
     * 取消操作
     */
    public void cancel(Long paymentId) {
        WalletPayment walletPayment = walletPaymentManager.findByPaymentId(paymentId)
                .orElseThrow(() -> new BizException("未查询到查询交易记录"));
        walletPayment.setPayStatus(PayStatusCode.TRADE_CANCEL);
        walletPaymentManager.updateById(walletPayment);
    }
}
