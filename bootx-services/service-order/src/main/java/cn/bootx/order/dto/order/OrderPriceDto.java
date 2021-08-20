package cn.bootx.order.dto.order;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @author xxm
 * @date 2020/10/18
 */
@Data
@Accessors(chain = true)
@ApiModel("订单价格")
public class OrderPriceDto implements Serializable {

    private static final long serialVersionUID = 7509707540439019092L;

    public static final int TYPE_STRATEGY = 1;

    public static final int TYPE_FEE = 2;

    public static final int TYPE_TAX = 3;

    public static final int TYPE_OTHER = 4;

    private Long id;

    private Long orderId;

    private String name;

    private int type;

    private BigDecimal amount;

    private String addition;

    private String remark;

}
