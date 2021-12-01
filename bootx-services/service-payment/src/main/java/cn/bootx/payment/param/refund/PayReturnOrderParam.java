package cn.bootx.payment.param.refund;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
* @author xxm
* @date 2020/12/10
*/
@Data
@Accessors(chain = true)
@Schema(title = "退货单参数")
public class PayReturnOrderParam implements Serializable {

    private static final long serialVersionUID = -4453617818464427099L;
    private Long id;


    private BigDecimal payAmount;

    private Long originOrderId;

    private List<PayReturnOrderDetailParam> details;

}
