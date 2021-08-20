package cn.bootx.order.param.order;


import cn.bootx.order.dto.order.OrderPriceDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**   
* 应用于订单的价格项目，实付金额会根据本列表进行计算
* @author xxm  
* @date 2020/10/15 
*/
@Data
@Accessors(chain = true)
@ApiModel("订单价格信息参数")
public class OrderPriceInfoParam implements Serializable {


    public static final int TYPE_STRATEGY = OrderPriceDto.TYPE_STRATEGY;

    public static final int TYPE_FEE = OrderPriceDto.TYPE_FEE;

    public static final int TYPE_TAX = OrderPriceDto.TYPE_TAX;

    public static final int TYPE_OTHER = OrderPriceDto.TYPE_OTHER;
    private static final long serialVersionUID = -2629554281566395675L;


    /**
     * 价格类型 (默认 TYPE_OTHER)
     */
    private Integer type = TYPE_OTHER;

    /**
     * 价格项目名称
     */
    private String name;

    /**
     * 金额(实付金额会+/-本金额)
     */
    private BigDecimal amount;

    /**
     * 备注内容会直接计入价格项目的备注
     */
    private String remark;

    private String addition;
}
