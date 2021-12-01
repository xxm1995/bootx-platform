package cn.bootx.sales.dto.order;

import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "订单明细预览结果")
public class OrderDetailPreviewResult implements Serializable {

    private static final long serialVersionUID = -5612212555027798683L;

    @Schema(description= "类目ID")
    private Long categoryId;

    @Schema(description= "店铺ID")
    private Long shopId;

    @Schema(description= "商品ID")
    private Long goodsId;

    @Schema(description= "skuId")
    private Long skuId;

    @Schema(description= "商品名")
    private String goodsTitle;

    @Schema(description= "商品价格")
    private BigDecimal goodsPrice;

    @Schema(description= "商品数量")
    private int num;

    @Schema(description= "是否允许分摊")
    private Boolean isShare = true;

    @Schema(description= "总金额(原始)")
    private BigDecimal totalAmount;

    @Schema(description= "优惠差价")
    private BigDecimal payChange;

    @Schema(description= "总金额(优惠后)")
    private BigDecimal payAmount;

    @Schema(description= "应用策略后价格变动记录")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();
}
