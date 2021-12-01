package cn.bootx.order.dto.order;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
* @author xxm
* @date 2020/10/21
*/
@Data
@Accessors(chain = true)
@Schema(title = "订单明细")
public class OrderDetailDto implements Serializable {

    private static final long serialVersionUID = 7528634567769864592L;

    @Schema(name = "主键ID")
    private Long id;

    @Schema(name = "活动ID")
    private Long activeId;

    @Schema(name = "店铺ID")
    private Long shopId;

    @Schema(name = "订单ID")
    private Long orderId;

    @Schema(name = "类目ID")
    private Long categoryId;

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

    @Schema(name = "总金额(原始)")
    private BigDecimal totalAmount;

    @Schema(name = "优惠差价")
    private BigDecimal payChange;

    @Schema(name = "总金额(优惠后)")
    private BigDecimal payAmount;

    @Schema(name = "状态")
    private int state = 0;

    @Schema(name = "是否虚拟商品")
    private Boolean isVirtual = false;

    @Schema(name = "addition")
    private String addition;

    @Schema(name = "应用策略后价格变动记录")
    private List<OrderStrategyMappingDto> mappings = new ArrayList<>();

}
