package cn.bootx.payment.core.paymodel.wallet.dao;

import cn.bootx.common.core.entity.UserDetail;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import cn.bootx.payment.param.paymodel.wallet.WalletPayParam;
import cn.bootx.starter.auth.util.SecurityUtil;
import cn.hutool.core.util.DesensitizedUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Optional;

/**   
* 钱包管理
* @author xxm  
* @date 2020/12/8 
*/
@Repository
@RequiredArgsConstructor
public class WalletManager extends BaseManager<WalletMapper,Wallet> {
    private final WalletMapper walletMapper;

    /**
     * 更新余额
     *
     * @param walletId 钱包
     * @param amount   金额
     * @return 更新数量
     */
    public int increaseBalance(Long walletId, BigDecimal amount) {
        Long userId = SecurityUtil.getCurrentUser().map(UserDetail::getId).orElse(DesensitizedUtil.userId());
        return walletMapper.increaseBalance(walletId, amount, userId, LocalDateTime.now());
    }


    /**
     * 扣减余额
     *
     * @param walletId 钱包ID
     * @param amount   扣减金额
     * @return 操作条数
     */
    public int reduceBalance(Long walletId, BigDecimal amount) {
        Long userId = SecurityUtil.getCurrentUser().map(UserDetail::getId).orElse(DesensitizedUtil.userId());
        return walletMapper.reduceBalance(walletId, amount, userId, LocalDateTime.now());
    }

    /**
     * 扣减余额-允许扣成负数
     *
     * @param walletId 钱包ID
     * @param amount   扣减金额
     * @return 剩余条数
     */
    public int reduceBalanceUnlimited(Long walletId, BigDecimal amount) {
        Long userId = SecurityUtil.getCurrentUser().map(UserDetail::getId).orElse(DesensitizedUtil.userId());
        return walletMapper.reduceBalanceUnlimited(walletId, amount, userId, LocalDateTime.now());
    }

    /**
     * 更新钱包状态
     */
    public void setUpStatus(Long walletId, int status) {
        lambdaUpdate().eq(Wallet::getId,walletId)
                .set(Wallet::getStatus,status)
                .update();
    }

    /**
     * 用户钱包是否存在
     */
    public boolean existsByUser(Long userId) {
        return existedByField(Wallet::getUserId,userId);
    }

    /**
     * 查询用户的钱包
     */
    public Optional<Wallet> findByUser(Long userId) {
        return findByField(Wallet::getUserId,userId);
    }


    /**
     * 分页查询
     */
    public Page<Wallet> page(PageParam pageParam, WalletPayParam param){

        Page<Wallet> mpPage = MpUtil.getMpPage(pageParam, Wallet.class);
        return this.lambdaQuery()
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }
}
