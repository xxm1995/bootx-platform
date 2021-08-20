package cn.bootx.payment.dto.pay;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2021/2/28
*/
@Data
@Accessors(chain = true)
@ApiModel("异步支付")
public class AsyncPayInfo implements Serializable {

    /** 支付参数体 */
    private String payBody;
}
