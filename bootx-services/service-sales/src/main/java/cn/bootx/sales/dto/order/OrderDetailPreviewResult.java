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

    @Schema(name = "类目ID")
    private Long categoryId;

    @Schema(name = "店铺ID")
    private Long shopId;

    @Schema(name = "商品ID")
    private Long goodsId;

    @Schema(name = "skuId")
    private Long skuId;

    @Schema(name = "商品名")
    private String goodsTitle;

    @Schema(name = "商品价格")
    private BigDecimal goodsPrice;

    @Schema(name = "商品数量")
    private int num;

    @Schema(name = "是否允许分摊")
    private Boolean isShare = true;

    @Schema(name = "总金额(原始)")
    private BigDecimal totalAmount;

    @Schema(name = "优惠差价")
    private BigDecimal payChange;

    @Schema(name = "总金额(优惠后)")
    private BigDecimal payAmount;

    @Schema(name = "应用策略后价格变动记录")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();
}
