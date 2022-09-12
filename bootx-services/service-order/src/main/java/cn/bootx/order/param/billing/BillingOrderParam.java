package cn.bootx.order.param.billing;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
* @author xxm
* @date 2020/12/10
*/
@Data
@Accessors(chain = true)
@Schema(title = "分账订单参数")
public class BillingOrderParam implements Serializable {

    private static final long serialVersionUID = 157222599179861801L;
    @Schema(description= "订单ID", required = true)
    private Long id;

    @Schema(description= "订单号")
    private String code;

    @Schema(description= "订单描述")
    private String description;

    @Schema(description= "支付金额")
    private BigDecimal payAmount;

    @Schema(description= "订单详情列表",required = true)
    private List<BillingOrderDetailParam> orderDetailParams = new ArrayList<>();
}
