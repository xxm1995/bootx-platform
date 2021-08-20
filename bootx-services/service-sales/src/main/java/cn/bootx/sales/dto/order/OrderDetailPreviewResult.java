package cn.bootx.sales.dto.order;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
* @author xxm
* @date 2020/10/25
*/
@Data
@Accessors(chain = true)
@ApiModel("订单明细预览结果")
public class OrderDetailPreviewResult implements Serializable {

    private static final long serialVersionUID = -5612212555027798683L;

    @ApiModelProperty("类目ID")
    private Long categoryId;

    @ApiModelProperty("店铺ID")
    private Long shopId;

    @ApiModelProperty("商品ID")
    private Long goodsId;

    @ApiModelProperty("skuId")
    private Long skuId;

    @ApiModelProperty("商品名")
    private String goodsTitle;

    @ApiModelProperty("商品价格")
    private BigDecimal goodsPrice;

    @ApiModelProperty("商品数量")
    private int num;

    @ApiModelProperty("是否允许分摊")
    private Boolean isShare = true;

    @ApiModelProperty(value = "总金额(原始)")
    private BigDecimal totalAmount;

    @ApiModelProperty(value = "优惠差价")
    private BigDecimal payChange;

    @ApiModelProperty(value = "总金额(优惠后)")
    private BigDecimal payAmount;

    @ApiModelProperty("应用策略后价格变动记录")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();
}
