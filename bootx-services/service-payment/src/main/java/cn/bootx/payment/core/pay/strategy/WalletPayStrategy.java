package cn.bootx.payment.core.pay.strategy;

import cn.bootx.common.core.util.BigDecimalUtil;
import cn.bootx.payment.code.pay.PayChannelCode;
import cn.bootx.payment.core.pay.exception.ExceptionInfo;
import cn.bootx.payment.core.pay.func.AbsPayStrategy;
import cn.bootx.payment.core.paymodel.wallet.dao.WalletManager;
import cn.bootx.payment.core.paymodel.wallet.entity.Wallet;
import cn.bootx.payment.core.paymodel.wallet.service.WalletPayService;
import cn.bootx.payment.core.paymodel.wallet.service.WalletPaymentService;
import cn.bootx.payment.exception.waller.WalletLackOfBalanceException;
import cn.bootx.payment.exception.waller.WalletNotExistsException;
import cn.bootx.payment.param.pay.PayParam;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**   
* 钱包支付策略
* @author xxm  
* @date 2020/12/11 
*/
@Scope(SCOPE_PROTOTYPE)
@Component
@RequiredArgsConstructor
public class WalletPayStrategy extends AbsPayStrategy {

    private final WalletManager walletManager;
    private final WalletPaymentService walletPaymentService;
    private final WalletPayService walletPayService;

    private Wallet wallet;

    @Override
    public int getType() {
        return PayChannelCode.WALLET;
    }

    /**
     * 支付前处理
     */
    @Override
    public void doBeforePayHandler() {

        PayParam payParam = this.getPayParam();
        // 校验钱包
        this.wallet = walletManager.findByUser(payParam.getUserId())
                .orElseThrow(WalletNotExistsException::new);
        // 判断余额
        boolean lackBalance = BigDecimalUtil.compareTo(this.wallet.getBalance(),getPayMode().getAmount()) < 0 ;
        if (lackBalance) {
            throw new WalletLackOfBalanceException();
        }
    }

    /**
     * 支付异常处理
     */
    @Override
    public void doErrorHandler(ExceptionInfo exceptionInfo) {
        walletPaymentService.updateError(this.getPayment().getId());
    }

    /**
     * 支付操作
     */
    @Override
    public void doPayHandler() {
        walletPayService.pay(getPayMode().getAmount(),
                this.getPayment(),
                this.getPayParam().getUserId());
        walletPaymentService.savePayment(this.getPayment(), this.getPayParam(),this.getPayMode(),this.wallet);
    }

    /**
     * 成功
     */
    @Override
    public void doSuccessHandler() {
        walletPaymentService.updateSuccess(this.getPayment().getId());
    }

    /**
     * 取消支付并返还金额
     */
    @Override
    public void doCloseHandler() {
        walletPayService.close(this.getPayment().getId());
    }

}
