package cn.bootx.sales.param.coupon;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/1
*/
@Data
@Accessors(chain = true)
@ApiModel("优惠券领取参数")
public class ObtainCouponParam implements Serializable {

    private static final long serialVersionUID = -2819314899657082887L;

    @ApiModelProperty("优惠券模板Id")
    private Long templateId;

    @ApiModelProperty("用户Id")
    private Long userId;

    @ApiModelProperty("设备id")
    private Long deviceId;

    @ApiModelProperty("ip")
    private String ip;

    @ApiModelProperty("渠道Id")
    private Long channelId;
}
