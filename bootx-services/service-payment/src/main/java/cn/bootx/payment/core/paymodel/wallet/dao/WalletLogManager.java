package cn.bootx.payment.core.paymodel.wallet.dao;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.payment.core.paymodel.wallet.entity.WalletLog;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
* 钱包日志
* @author xxm
* @date 2020/12/8
*/
@Repository
@RequiredArgsConstructor
public class WalletLogManager extends BaseManager<WalletLogMapper,WalletLog> {

    /**
     * 按付款查找优先
     */
    public Optional<WalletLog> findFirstByPayment(Long paymentId) {
        return lambdaQuery().eq(WalletLog::getPaymentId,paymentId)
                .orderByDesc(MpBaseEntity::getCreateTime)
                .last("limit 1")
                .oneOpt();
    }
}
