package cn.bootx.payment.param.refund;

import io.swagger.annotations.ApiModel;
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
@ApiModel("退货单详细参数")
public class PayReturnOrderDetailParam implements Serializable {

    private static final long serialVersionUID = 4473413805342579320L;
    private Long id;

    private Long orderId;

    private Long skuId;

    private BigDecimal payAmount;

    private Long originDetailId;

    /** 所有换货单 */
    private List<Long> swapOrderDetailIds;

}
