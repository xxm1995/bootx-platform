package cn.bootx.payment.code.pay;

import java.util.Arrays;
import java.util.List;

/**
* 支付通道
* @author xxm
* @date 2021/2/24
*/
public interface PayChannelCode {
    /**
     * 支付通道类型 1.支付宝 2.微信 3.现金 4.钱包 5.积分 6.代金券 7.兑换券 8.信用卡 9.ApplePay 10.渠道方支付
     */
    int ALI = 1;
    int WECHAT = 2;
    int CASH = 3;
    int WALLET = 4;
    int CREDIT = 6;
    int VOUCHER = 7;
    int CREDIT_CARD = 8;
    int APPLE_PAY = 9;
    int CHANNEL_PAY = 10;

    /** 异步支付通道 */
    List<Integer> SYNC_TYPE = Arrays.asList(
            ALI,
            WECHAT,
            APPLE_PAY
    );
}
