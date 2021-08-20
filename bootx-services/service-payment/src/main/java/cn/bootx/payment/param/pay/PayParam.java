package cn.bootx.payment.param.pay;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
* @author xxm
* @date 2020/12/9
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "支付参数")
public class PayParam implements Serializable {
    private static final long serialVersionUID = 3895679513150533566L;

    @ApiModelProperty(value = "用户ID")
    private Long userId;

    @ApiModelProperty(value = "业务ID")
    private String businessId;

    @ApiModelProperty("支付标题")
    private String title;

    @ApiModelProperty("支付描述")
    private String description;

    @ApiModelProperty(value = "支付信息",required = true)
    private List<PayModeParam> payModeList;
}
