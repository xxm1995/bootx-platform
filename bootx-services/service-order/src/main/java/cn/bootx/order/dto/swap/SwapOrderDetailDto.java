package cn.bootx.order.dto.swap;

import cn.bootx.order.dto.order.OrderDetailPriceDto;
import cn.bootx.order.param.order.OrderPriceInfoParam;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhangguoquan on 18/5/23.
 */
@ApiModel(value = "换货单明细")
public class SwapOrderDetailDto implements Serializable {

    private static final long serialVersionUID = -1015141227389911373L;
    @ApiModelProperty(name = "id", value = "换货单明细主键")
    private Long id;

    @ApiModelProperty(name = "orderId", value = "换货单订单ID")
    private Long orderId;

    @ApiModelProperty(name = "skuId", value = "skuId")
    private Long skuId;

    @ApiModelProperty(name = "lastSkuId", value = "上一个skuId")
    private Long lastSkuId;

    @ApiModelProperty(name = "payAmount", value = "支付金额")
    private BigDecimal payAmount;

    @ApiModelProperty(name = "originDetailId", value = "原订单明细ID")
    private Long originDetailId;

    @ApiModelProperty(name = "lastDetailId", value = "上一个订单明细ID")
    private Long lastDetailId;

    /**
     * 换货订单 差价意外的价格信息，SwapOrderDetail 的payAmount 包含priceInfoParamList 中的金额
     */
    @ApiModelProperty(name = "priceInfoParamList", value = "换货订单 差价意外的价格信息")
    private List<OrderPriceInfoParam> priceInfoParamList;

    /**
     * 换货订单 差价意外的价格信息，SwapOrderDetail 的payAmount 包含pricelist 中的金额
     */
    @ApiModelProperty(name = "detailsPriceList", value = "查询结果：换货订单 差价意外的价格信息")
    private List<OrderDetailPriceDto> detailsPriceList = new ArrayList<>();

}
