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

    @Schema(description= "主键ID")
    private Long id;

    @Schema(description= "活动ID")
    private Long activeId;

    @Schema(description= "店铺ID")
    private Long shopId;

    @Schema(description= "订单ID")
    private Long orderId;

    @Schema(description= "类目ID")
    private Long categoryId;

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

    @Schema(description= "总金额(原始)")
    private BigDecimal totalAmount;

    @Schema(description= "优惠差价")
    private BigDecimal payChange;

    @Schema(description= "总金额(优惠后)")
    private BigDecimal payAmount;

    @Schema(description= "状态")
    private int state = 0;

    @Schema(description= "是否虚拟商品")
    private Boolean isVirtual = false;

    @Schema(description= "addition")
    private String addition;

    @Schema(description= "应用策略后价格变动记录")
    private List<OrderStrategyMappingDto> mappings = new ArrayList<>();

}
