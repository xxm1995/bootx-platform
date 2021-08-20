package cn.bootx.payment.code.pay;

import cn.bootx.common.core.exception.BizException;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.Objects;

/**
* 支付通道枚举
* @author xxm  
* @date 2021/7/26 
*/
@Getter
@AllArgsConstructor
public enum PayChannelEnum {

    ALI(PayChannelCode.ALI,"ALI"),
    WECHAT(PayChannelCode.WECHAT,"WECHAT"),
    CASH(PayChannelCode.CASH,"CASH"),
    WALLET(PayChannelCode.WALLET,"WALLET"),
    CREDIT(PayChannelCode.CREDIT,"CREDIT"),
    VOUCHER(PayChannelCode.VOUCHER,"VOUCHER"),
    CREDIT_CARD(PayChannelCode.CREDIT_CARD,"CREDIT"),
    APPLE_PAY(PayChannelCode.APPLE_PAY,"APPLE"),
    CHANNEL_PAY(PayChannelCode.CHANNEL_PAY,"CHANNEL");

    /** 支付通道数字编码 */
    private final int no;
    /** 支付通道字符编码 */
    private final String code;

    /**
     * 根据数字编号获取
     */
    public static PayChannelEnum findByNo(int no){
        return Arrays.stream(PayChannelEnum.values())
                .filter(e -> e.getNo() == no)
                .findFirst()
                .orElseThrow(() -> new BizException("不存在的支付通道"));
    }
    /**
     * 根据字符编码获取
     */
    public static PayChannelEnum findByCode(String code){
        return Arrays.stream(PayChannelEnum.values())
                .filter(e -> Objects.equals(code,e.getCode()))
                .findFirst()
                .orElseThrow(() -> new BizException("不存在的支付通道"));
    }

    public static boolean existsByCode(String code) {
        return Arrays.stream(PayChannelEnum.values())
                .anyMatch(payChannelEnum -> Objects.equals(payChannelEnum.getCode(),code));
    }
}
