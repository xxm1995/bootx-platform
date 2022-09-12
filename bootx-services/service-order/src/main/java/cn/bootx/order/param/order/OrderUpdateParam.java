package cn.bootx.order.param.order;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "订单更新参数")
public class OrderUpdateParam implements Serializable {

    private static final long serialVersionUID = 4460069559043995466L;
    private Long id;

    @Schema(description= "姓名")
    private String contactName;

    @Schema(description= "手机")
    private String contactPhone;

    @Schema(description= "邮箱")
    private String contactEmail;

    @Schema(description= "支付时间")
    private Date payTime;

    @Schema(description= "状态")
    private Integer state;

    private Long buyerId;

}
