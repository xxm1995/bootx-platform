package cn.bootx.payment.core.paymodel.wallet.service;

import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.code.paymodel.WalletCode;
import cn.bootx.payment.core.payment.entity.Payment;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletLogManager;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletManager;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletPaymentManager;
import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import cn.bootx.payment.core.paymodel.wallet.entity.WalletLog;
import cn.bootx.payment.dto.paymodel.wallet.WalletDto;
import cn.bootx.payment.exception.waller.WalletLackOfBalanceException;
import cn.bootx.payment.exception.waller.WalletLogError;
import cn.bootx.payment.exception.waller.WalletNotExistsException;
import cn.bootx.payment.param.refund.PayRefundDetailParam;
import cn.bootx.payment.param.refund.PayRefundParam;
import cn.hutool.core.util.StrUtil;
import com.google.common.collect.Lists;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

/**
* 钱包支付操作
* @author xxm
* @date 2021/2/27
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class WalletPayService {

    private final WalletService walletService;

    private final WalletManager walletManager;
    private final WalletPaymentManager walletPaymentManager;
    private final WalletLogManager walletLogManager;

    /**
     * 支付操作
     * @param amount         付款金额
     * @param payment        支付记录
     * @param userId         用户Id
     */
    public void pay(BigDecimal amount, Payment payment, Long userId) {
        // 获取钱包
        WalletDto wallet = walletService.getByUserId(userId);

        // 扣减余额
        int i = walletManager.reduceBalance(wallet.getId(), amount);

        // 判断操作结果
        if (i < 1) {
            throw new WalletLackOfBalanceException();
        }
        // 日志
        WalletLog walletLog = new WalletLog()
                .setWalletId(wallet.getId())
                .setUserId(wallet.getUserId())
                .setPaymentId(payment.getId())
                .setAmount(payment.getAmount())
                .setType(WalletCode.WALLET_LOG_PAY)
                .setRemark(String.format("钱包支付金额 %.2f ", amount))
                .setOperationSource(WalletCode.OPERATION_SOURCE_USER)
                .setBusinessId(payment.getBusinessId());
        walletLogManager.save(walletLog);
    }

    /**
     * 根据支付单对钱包充值的余额进行扣减
     */
    @Transactional(rollbackFor = Exception.class)
    public void deductedBalanceByPaymentId(Long paymentId, Long orderId, String remark, Boolean isThrowError) {

        // 根据支付记录ID查询交易的金额和交易的钱包ID
        WalletLog walletLog =  walletLogManager.findFirstByPayment(paymentId).orElse(null);
        if (walletLog == null) {
            return;
        }

        // 充值类型
        List<Integer> chargeLogType = Lists.newArrayList(WalletCode.WALLET_LOG_RECHARGE,
                WalletCode.WALLET_LOG_AUTO_RECHARGE,
                WalletCode.WALLET_LOG_ADMIN_RECHARGE);

        // 保证是充值类型 且充值金额大于0
        if (!chargeLogType.contains(walletLog.getType()) || BigDecimalUtil.compareTo(walletLog.getAmount(), BigDecimal.ZERO) < 0) {
            log.warn("退款 发现非充值交易，日志ID:{},交易类型:{}", walletLog.getId(), walletLog.getType());
            if (isThrowError) {
                throw new WalletLogError();
            }
            return;
        }

        // 获取钱包ID 并扣减对应金额(允许扣成负数)
        walletManager.reduceBalanceUnlimited(walletLog.getWalletId(), walletLog.getAmount());

        // 记录日志
        WalletLog log = new WalletLog()
                .setWalletId(walletLog.getWalletId())
                .setUserId(walletLog.getUserId())
                .setPaymentId(paymentId)
                .setAmount(walletLog.getAmount())
                .setType(WalletCode.WALLET_LOG_SYSTEM_REDUCE_BALANCE)
                .setRemark(StrUtil.format("系统减少余额 %.2f (" + remark + ")", walletLog.getAmount()))
                .setOperationSource(WalletCode.OPERATION_SOURCE_SYSTEM)
                .setPaymentId(paymentId)
                .setBusinessId(String.valueOf(orderId));
        walletLogManager.save(log);

    }

    /**
     * 退款
     */
    @Transactional(rollbackFor = Exception.class)
    public void refund(PayRefundParam payRefundParam, List<PayRefundDetailParam> payRefundDetailParams) {

        // 获取钱包
        Wallet wallet = walletManager.findById(payRefundParam.getWalletId()).orElseThrow(WalletNotExistsException::new);

        // 计算总退款金额
        BigDecimal totalRefundAmount = payRefundDetailParams.stream()
                .map(PayRefundDetailParam::getRefundAmount)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        walletManager.increaseBalance(payRefundParam.getWalletId(), totalRefundAmount, null);

        for (PayRefundDetailParam payRefundDetailParam : payRefundDetailParams) {

            WalletLog walletLog = new WalletLog()
                    .setAmount(payRefundDetailParam.getRefundAmount())
                    .setPaymentId(payRefundDetailParam.getPaymentId())
                    .setWalletId(wallet.getId())
                    .setUserId(wallet.getUserId())
                    .setType(WalletCode.WALLET_LOG_REFUND)
                    .setRemark(String.format("钱包退款金额 %.2f ", payRefundDetailParam.getRefundAmount()))
                    .setOperationSource(WalletCode.OPERATION_SOURCE_ADMIN)
                    .setBusinessId(String.valueOf(payRefundDetailParam.getOrderId()));
            // save log
            walletLogManager.save(walletLog);
        }
    }

    /**
     * 取消支付并返还金额
     */
    public void close(Long paymentId){
        // 钱包支付记录
        walletPaymentManager.findByPaymentId(paymentId).ifPresent(walletPayment -> {
            Optional<Wallet> walletOpt = walletManager.findById(walletPayment.getWalletId());
            if (!walletOpt.isPresent()){
                log.error("钱包出现恶性问题,需要人工排查");
                return;
            }
            Wallet wallet = walletOpt.get();
            walletPayment.setPayStatus(PayStatusCode.TRADE_CANCEL);
            walletPaymentManager.save(walletPayment);

            // 金额返还
            walletManager.increaseBalance(wallet.getId(), walletPayment.getAmount(), null);

            // 记录日志
            WalletLog walletLog = new WalletLog()
                    .setAmount(walletPayment.getAmount())
                    .setPaymentId(walletPayment.getPaymentId())
                    .setWalletId(wallet.getId())
                    .setUserId(wallet.getUserId())
                    .setType(WalletCode.WALLET_LOG_REFUND)
                    .setRemark(String.format("取消支付返回金额 %.2f ", walletPayment.getAmount()))
                    .setOperationSource(WalletCode.OPERATION_SOURCE_SYSTEM)
                    .setBusinessId(walletPayment.getBusinessId());
            // save log
            walletLogManager.save(walletLog);
        });
    }
}
