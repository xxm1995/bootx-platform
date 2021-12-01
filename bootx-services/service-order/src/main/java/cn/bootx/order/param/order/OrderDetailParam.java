package cn.bootx.order.param.order;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Data
@Accessors(chain = true)
@Schema(title = "订单明细参数")
public class OrderDetailParam implements Serializable {

    private static final long serialVersionUID = 2984639517325652160L;
    @Schema(name = "类目id")
    private Long categoryId;

    @Schema(name = "活动ID")
    private Long activeId;

    @Schema(name = "店铺id")
    private Long shopId;

    @Schema(name = "商品id")
    private Long goodsId;

    @Schema(name = "sku id")
    private Long skuId;

    @Schema(name = "商品名")
    private String goodsTitle;

    @Schema(name = "商品价格")
    private BigDecimal goodsPrice;

    @Schema(name = "数量")
    private int num;

    @Schema(name = "附加参数 json")
    private String addition;

    @Schema(name = "使用的活动策略id集合")
    private List<Long> activityIds;

}
