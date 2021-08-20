package cn.bootx.order.param.order;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
* @author xxm
* @date 2020/10/31
*/
@Data
@Accessors(chain = true)
@ApiModel(value = "订单更新参数")
public class OrderUpdateParam implements Serializable {

    private static final long serialVersionUID = 4460069559043995466L;
    private Long id;

    @ApiModelProperty(value = "姓名")
    private String contactName;

    @ApiModelProperty(value = "手机")
    private String contactPhone;

    @ApiModelProperty(value = "邮箱")
    private String contactEmail;

    @ApiModelProperty(value = "支付时间")
    private Date payTime;

    @ApiModelProperty(value = "状态")
    private Integer state;

    private Long buyerId;

}
