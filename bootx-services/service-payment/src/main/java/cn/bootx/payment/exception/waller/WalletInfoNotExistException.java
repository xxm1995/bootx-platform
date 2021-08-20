package cn.bootx.payment.exception.waller;


import cn.bootx.common.core.exception.FatalException;
import cn.bootx.payment.code.PaymentCenterErrorCode;

/**   
* 钱包信息不存在
* @author xxm  
* @date 2020/12/8 
*/
public class WalletInfoNotExistException extends FatalException {

    public WalletInfoNotExistException() {
        super(PaymentCenterErrorCode.WALLET_INFO_NOT_EXISTS, "钱包信息不存在");
    }
}
