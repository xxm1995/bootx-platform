package cn.bootx.order.dto.swap;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import javax.validation.constraints.Size;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Created by zhangguoquan on 18/5/23.
 */
@ApiModel(value = "换货单")
public class SwapOrderDto implements Serializable {

    private static final long serialVersionUID = -7007678334500681771L;
    @ApiModelProperty(value = "换货单主键")
    private Long id;

    @ApiModelProperty(value = "租户ID")
    private Long tenantId;

    @ApiModelProperty(value = "渠道ID")
    private Long channelId;

    @ApiModelProperty(value = "支付金额")
    private BigDecimal payAmount;

    @ApiModelProperty(value = "原订单ID")
    private Long originOrderId;

    @ApiModelProperty(value = "上一个订单ID")
    private Long lastOrderId;

    @ApiModelProperty(value = "换货单明细集合")
    private List<SwapOrderDetailDto> detailDtos;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "创建人")
    private Long creator;

    @ApiModelProperty(value = "设备ID")
    @Size(max = 100, message = "deviceId max length is 100")
    private String deviceId;

    @ApiModelProperty(value = "支付时间")
    private Date payTime;

    @ApiModelProperty(value = "状态")
    private int state;

    @ApiModelProperty(name = "businessId",value = "业务主键")
    private Long businessId;

}
