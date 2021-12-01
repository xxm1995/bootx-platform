package cn.bootx.order.param.billing;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

/**
* @author xxm
* @date 2020/12/09
*/
@Data
@Accessors(chain = true)
@Schema(title = "分账订单明细参数")
public class BillingOrderDetailParam implements Serializable {

    private static final long serialVersionUID = 6183800463776194467L;
    @Schema(description= "订单明细ID", required = true)
    private Long id;

    @Schema(description= "库存单品Id", required = true)
    private Long skuId;

    @Schema(description= "商品标题")
    private String goodsTitle;

    @Schema(description= "商品价格")
    private BigDecimal goodsPrice;

    @Schema(description= "数量")
    private int num;

    @Schema(description= "支付金额")
    private BigDecimal payAmount;

    @Schema(description= "状态")
    private int state = 0;

    @Schema(description= "订单项扩展信息")
    private String addition;

    /**
     * 该detail不支持的支付方式
     * (例如 部分prod不支持积分支付,那么在记账的时候该product将无法分担积分部分的账单金额)
     */
    @Schema(description= "该detail不支持的支付方式")
    private List<Integer> unsupportedPaymentType;

    @Schema(description= "剩余记账次数(当前只用于订单，不支持商品附加服务额外付款)", hidden = true)
    private int leftBillingNum;

    @Schema(description= "未记账金额", hidden = true)
    private BigDecimal leftBillingAmount;
}
