package cn.bootx.sales.param.coupon;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/12/1
*/
@Data
@Accessors(chain = true)
@Schema(title = "优惠券领取参数")
public class ObtainCouponParam implements Serializable {

    private static final long serialVersionUID = -2819314899657082887L;

    @Schema(name = "优惠券模板Id")
    private Long templateId;

    @Schema(name = "用户Id")
    private Long userId;

    @Schema(name = "设备id")
    private Long deviceId;

    @Schema(name = "ip")
    private String ip;

    @Schema(name = "渠道Id")
    private Long channelId;
}
