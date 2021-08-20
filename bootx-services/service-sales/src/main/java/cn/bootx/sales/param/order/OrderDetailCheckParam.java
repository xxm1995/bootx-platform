package cn.bootx.sales.param.order;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;

@Data
@Accessors(chain = true)
@ApiModel("订单明细参数")
public class OrderDetailCheckParam implements Serializable {

    private static final long serialVersionUID = 2984639517325652160L;
    @ApiModelProperty("类目id")
    private Long categoryId;

    @ApiModelProperty("店铺id")
    private Long shopId;

    @ApiModelProperty("商品id")
    private Long goodsId;

    @ApiModelProperty("sku id")
    private Long skuId;

    @ApiModelProperty("商品名")
    private String goodsTitle;

    @ApiModelProperty("商品价格")
    private BigDecimal goodsPrice;

    @ApiModelProperty("是否虚拟商品")
    private Boolean isVirtual = false;

    @ApiModelProperty("是否允许分摊")
    private Boolean isShare = true;

    @ApiModelProperty("数量")
    private int num;

    @ApiModelProperty("使用的活动策略id集合")
    private List<Long> activityIds;

}
