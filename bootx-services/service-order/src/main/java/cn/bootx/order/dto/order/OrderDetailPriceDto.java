package cn.bootx.order.dto.order;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author xxm
 * @date 2020/10/30
 */
@Data
@Accessors(chain = true)
@ApiModel("订单详细价格")
public class OrderDetailPriceDto implements Serializable {

    private static final long serialVersionUID = 6826090889958126998L;

    private Long id;

    private Long orderId;

    private Long orderDetailId;

    private Long orderPriceId;

    private String name;

    private int type;

    private BigDecimal amount;

    private String addition;

    private String remark;

}

