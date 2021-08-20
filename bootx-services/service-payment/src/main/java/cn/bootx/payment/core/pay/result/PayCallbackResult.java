package cn.bootx.payment.core.pay.result;

import cn.bootx.payment.code.pay.PayStatusCode;
import lombok.Data;
import lombok.experimental.Accessors;

/**   
* 支付回调处理结果
* @author xxm
* @date 2021/6/22 
*/
@Data
@Accessors(chain = true)
public class PayCallbackResult {

    /**
     * 处理状态
     * @see PayStatusCode
     */
    private int code;

    /** 提示信息 */
    private String msg;
}
