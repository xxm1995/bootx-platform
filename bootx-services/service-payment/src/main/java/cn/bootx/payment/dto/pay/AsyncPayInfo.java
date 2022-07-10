package cn.bootx.payment.dto.pay;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/2/28
*/
@Data
@Accessors(chain = true)
@Schema(title = "异步支付线程信息")
public class AsyncPayInfo implements Serializable {

    /** 支付参数体(通常用于发起支付的参数) */
    private String payBody;

    /** 第三方支付平台订单号(付款码支付直接成功时会出现) */
    private String tradeNo;
}
