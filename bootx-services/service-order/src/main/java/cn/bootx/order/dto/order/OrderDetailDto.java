package cn.bootx.order.dto.order;

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
* @date 2020/10/21
*/
@Data
@Accessors(chain = true)
@ApiModel("订单明细")
public class OrderDetailDto implements Serializable {

    private static final long serialVersionUID = 7528634567769864592L;

    @ApiModelProperty("主键ID")
    private Long id;

    @ApiModelProperty("活动ID")
    private Long activeId;

    @ApiModelProperty("店铺ID")
    private Long shopId;

    @ApiModelProperty("订单ID")
    private Long orderId;

    @ApiModelProperty("类目ID")
    private Long categoryId;

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

    @ApiModelProperty(value = "总金额(原始)")
    private BigDecimal totalAmount;

    @ApiModelProperty(value = "优惠差价")
    private BigDecimal payChange;

    @ApiModelProperty(value = "总金额(优惠后)")
    private BigDecimal payAmount;

    @ApiModelProperty("状态")
    private int state = 0;

    @ApiModelProperty("是否虚拟商品")
    private Boolean isVirtual = false;

    @ApiModelProperty("addition")
    private String addition;

    @ApiModelProperty("应用策略后价格变动记录")
    private List<OrderStrategyMappingDto> mappings = new ArrayList<>();

}
