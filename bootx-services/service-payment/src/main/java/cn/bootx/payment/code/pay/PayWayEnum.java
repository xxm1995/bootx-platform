package cn.bootx.payment.code.pay;

import cn.bootx.common.core.exception.BizException;
import lombok.AllArgsConstructor;
import lombok.Getter;

import java.util.Arrays;
import java.util.Objects;

/**   
* 支付方式
* @author xxm  
* @date 2021/7/26 
*/
@Getter
@AllArgsConstructor
public enum PayWayEnum {

    NORMAL(PayWayCode.NORMAL,"NORMAL"),
    WAP(PayWayCode.WAP,"WAP"),
    APP(PayWayCode.APP,"APP"),
    WEB(PayWayCode.WEB,"WEB"),
    QRCODE(PayWayCode.QRCODE,"QRCODE"),
    BARCODE(PayWayCode.BARCODE,"BARCODE"),

    JSAPI(PayWayCode.JSAPI,"JSAPI");

    /** 支付方式数字编码 */
    private final int no;
    /** 支付方式字符编码 */
    private final String code;

    /**
     * 根据数字编号获取
     */
    public static PayWayEnum findByNo(int no){
        return Arrays.stream(PayWayEnum.values())
                .filter(e -> e.getNo() == no)
                .findFirst()
                .orElseThrow(() -> new BizException("不存在的支付方式"));
    }
    /**
     * 根据字符编码获取
     */
    public static PayWayEnum findByCode(String code){
        return Arrays.stream(PayWayEnum.values())
                .filter(e -> Objects.equals(code,e.getCode()))
                .findFirst()
                .orElseThrow(() -> new BizException("不存在的支付方式"));
    }
}
