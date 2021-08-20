package cn.bootx.payment.dto.pay;


import cn.bootx.payment.dto.payment.PaymentDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
*
* @author xxm  
* @date 2020/12/9 
*/
@Data
@Accessors(chain = true)
@ApiModel("支付返回信息")
public class PayResult implements Serializable {

    private static final long serialVersionUID = 7729669194741851195L;

    /** 是否是异步支付 */
    private boolean syncPayMode;

    /** 异步支付方式 */
    private Integer syncPayTypeCode;

    /** 主支付记录 */
    private PaymentDto payment;

    /** 异步支付参数 */
    private AsyncPayInfo syncPayInfo;

}
