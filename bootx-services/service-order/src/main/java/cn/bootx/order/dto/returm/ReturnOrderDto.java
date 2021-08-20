package cn.bootx.order.dto.returm;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
* @author xxm
* @date 2020/11/19
*/
@Data
@Accessors(chain = true)
@ApiModel("退货单dto")
public class ReturnOrderDto implements Serializable {
    private static final long serialVersionUID = 3654344763212531452L;

    /**
     * 退款中
     */
    public static final int STATE_REFUNDING = 0;

    /**
     * 退款成功
     */
    public static final int STATE_REFUNDED = 1;

    /**
     * 退款失败
     */
    public static final int STATE_REFUND_FAILURE = 2;


    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("租户ID")
    private Long tenantId;

    @ApiModelProperty("渠道ID")
    private Long channelId;

    @ApiModelProperty("支付金额")
    private BigDecimal payAmount;

    @ApiModelProperty("原订单ID")
    private Long originOrderId;

    @ApiModelProperty("退货单状态")
    private Integer state;

    @ApiModelProperty("业务主键")
    private Long businessId;

    private List<ReturnOrderDetailDto> detailDtos;
}
