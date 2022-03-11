package cn.bootx.payment.core.paymodel.wallet.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletManager;
import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import cn.bootx.payment.dto.paymodel.wallet.WalletDto;
import cn.bootx.payment.param.paymodel.wallet.WalletPayParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**   
* 钱包
* @author xxm  
* @date 2022/3/11 
*/
@Slf4j
@Service
@RequiredArgsConstructor
public class WalletQueryService {
    private final WalletManager walletManager;

    /**
     * 根据ID查询Wallet
     */
    public WalletDto findById(Long walletId) {
        return walletManager.findById(walletId).map(Wallet::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 根据用户ID查询钱包
     */
    public WalletDto findByUserId(Long userId) {
        return walletManager.findByUser(userId).map(Wallet::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 查询用户 分页
     */
    public PageResult<WalletDto> page(PageParam pageParam, WalletPayParam param){
        return MpUtil.convert2DtoPageResult(walletManager.page(pageParam,param));
    }
}
