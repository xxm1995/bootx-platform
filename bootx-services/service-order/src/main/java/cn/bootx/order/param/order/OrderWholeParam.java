package cn.bootx.order.param.order;

import cn.bootx.order.dto.order.OrderAddressDto;
import cn.bootx.order.dto.order.OrderInvoiceDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**   
* 下单参数
* @author xxm  
* @date 2021/3/14 
*/
@Data
@Accessors(chain = true)
@ApiModel("下单参数")
public class OrderWholeParam implements Serializable {
    private static final long serialVersionUID = 7661069240452921149L;

    /** 订单参数 */
    private OrderParam orderParam;

    /** 收货信息 */
    private OrderAddressDto orderAddressInfo;

    /** 发票信息 */
    private OrderInvoiceDto orderInvoiceInfo;
}
