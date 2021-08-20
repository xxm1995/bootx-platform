package cn.bootx.payment.code.paymodel;

/**
* 钱包涉及到的常量
* @author xxm  
* @date 2020/12/8 
*/
public interface WalletCode {

    /**
     * 主动充值
     */
    int RECHARGE = 2;

    /**
     * 自动充值
     */
    int AUTO_RECHARGE = 3;

    /**
     * 系统操作
     */
    int OPERATION_SOURCE_SYSTEM = 1;

    /**
     * 管理员操作
     */
    int OPERATION_SOURCE_ADMIN = 2;

    /**
     * 用户操作
     */
    int OPERATION_SOURCE_USER = 3;

    /**
     * 保护模式-无保护
     */
    int PROTECTION_MODE_NONE = 0;

    /**
     * 保护模式-PIN Code
     */
    int PROTECTION_MODE_PIN = 1;

    /**
     * 保护模式-Finger/Face
     */
    int PROTECTION_MODE_OTHER = 2;

    /**
     * 钱包状态-正常
     */
    int WALLET_STATUS_NORMAL = 1;

    /**
     * 钱包状态-禁用
     */
    int WALLET_STATUS_FORBIDDEN = 2;

    /**
     * 钱包日志-开通
     */
    int WALLET_LOG_ACTIVE = 1;

    /**
     * 钱包日志-主动充值
     */
    int WALLET_LOG_RECHARGE = 2;

    /**
     * 钱包日志-自动充值
     */
    int WALLET_LOG_AUTO_RECHARGE = 3;

    /**
     * 钱包日志-Admin充值
     */
    int WALLET_LOG_ADMIN_RECHARGE = 4;

    /**
     * 钱包日志-支付
     */
    int WALLET_LOG_PAY = 5;

    /**
     * 钱包日志-修改安全模式
     */
    int WALLET_CHANGE_PROTECTION_MODE = 6;

    /**
     * 钱包日志-系统扣除余额的日志(通常是chargeback之类的交易取消之后需要扣除已充值的金额)
     */
    int WALLET_LOG_SYSTEM_REDUCE_BALANCE = 7;

    /**
     * 钱包日志-退款
     */
    int WALLET_LOG_REFUND = 8;

    /**
     * 钱包日志-赠送 handsel
     */
    int WALLET_LOG_PRESENT = 9;

}
