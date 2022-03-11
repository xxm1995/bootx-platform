package cn.bootx.payment.core.paymodel.wallet.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.payment.code.paymodel.WalletCode;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletLogManager;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletManager;
import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import cn.bootx.payment.core.paymodel.wallet.entity.WalletLog;
import cn.bootx.payment.exception.waller.WalletBannedException;
import cn.bootx.payment.exception.waller.WalletNotExistsException;
import cn.bootx.payment.param.paymodel.wallet.WalletActiveParam;
import cn.bootx.payment.param.paymodel.wallet.WalletRechargeParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Objects;

/**
 * 钱包的相关操作
 * @author xxm
 * @date 2020/12/8
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class WalletService{
    private final WalletManager walletManager;
    private final WalletLogManager walletLogManager;

    /**
     * 开通操作 创建
     */
    @Transactional(rollbackFor = Exception.class)
    public void createWallet(Long userId){
        // 判断钱包是否已开通
        if (walletManager.existsByUser(userId)) {
            throw new BizException("钱包已经开通");
        }
        Wallet wallet = new Wallet()
                .setUserId(userId)
                .setStatus(WalletCode.STATUS_NORMAL);

        // 激活 log
        WalletLog activeLog = new WalletLog()
                .setWalletId(wallet.getId())
                .setUserId(wallet.getUserId())
                .setType(WalletCode.LOG_ACTIVE)
                .setRemark("激活钱包")
                .setOperationSource(WalletCode.OPERATION_SOURCE_USER);
        walletLogManager.save(activeLog);

//        // 赠送记录log
//        if (BigDecimalUtil.compareTo(wallet.getBalance(), BigDecimal.ZERO) > 0) {
//            WalletLog presentLog = new WalletLog()
//                    .setWalletId(wallet.getId())
//                    .setUserId(wallet.getUserId())
//                    .setAmount(wallet.getBalance())
//                    .setType(WalletCode.WALLET_LOG_PRESENT)
//                    .setRemark("赠送")
//                    .setOperationSource(WalletCode.OPERATION_SOURCE_SYSTEM);
//            walletLogManager.save(presentLog);
//        }
    }

    /**
     * 批量开通
     */
    public void createWalletBatch(List<WalletActiveParam> walletActiveParams){

    }

    /**
     * 锁定钱包
     */
    public void lock(Long walletId){
        walletManager.setUpStatus(walletId,WalletCode.STATUS_FORBIDDEN);
    }

    /**
     * 解锁钱包
     */
    public void unlock(Long walletId){
        walletManager.setUpStatus(walletId,WalletCode.STATUS_NORMAL);
    }

    /**
     * 充值操作
     */
    @Transactional(rollbackFor = Exception.class)
    public void recharge(WalletRechargeParam param){
        Wallet wallet = this.getNormalWalletById(param.getWalletId());
        walletManager.increaseBalance(param.getWalletId(), param.getAmount());

        WalletLog walletLog = new WalletLog()
                .setAmount(param.getAmount())
                .setPaymentId(param.getPaymentId())
                .setWalletId(wallet.getId())
                .setUserId(wallet.getUserId())
                .setType(param.getType())
                .setRemark(String.format("钱包充值金额 %.2f ", param.getAmount()))
                .setOperationSource(param.getOperationSource())
                .setBusinessId(param.getBusinessId());
        walletLogManager.save(walletLog);
    }

    /**
     * 查询钱包，如果钱包不存在或者钱包被禁用将抛出异常
     */
    public Wallet getNormalWalletById(Long walletId) {
        // 查询Wallet
        Wallet wallet = walletManager.findById(walletId).orElseThrow(WalletNotExistsException::new);
        // 是否被禁用
        if (Objects.equals(WalletCode.STATUS_FORBIDDEN, wallet.getStatus())) {
            throw new WalletBannedException();
        }
        return wallet;
    }

    /**
     * 查询钱包，如果钱包不存在或者钱包被禁用将抛出异常
     */
    public Wallet getNormalWalletByUserId(Long userId) {
        // 查询Wallet
        Wallet wallet = walletManager.findByUser(userId).orElseThrow(WalletNotExistsException::new);
        // 是否被禁用
        if (Objects.equals(WalletCode.STATUS_FORBIDDEN, wallet.getStatus())) {
            throw new WalletBannedException();
        }
        return wallet;
    }
}
