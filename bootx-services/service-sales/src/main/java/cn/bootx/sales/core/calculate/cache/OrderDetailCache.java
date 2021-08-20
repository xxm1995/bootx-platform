package cn.bootx.sales.core.calculate.cache;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.order.OrderDetailPreviewResult;
import cn.bootx.sales.dto.order.OrderStrategyMappingResult;
import cn.hutool.core.bean.BeanUtil;
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
@ApiModel("订单计算缓存明细对象")
public class OrderDetailCache implements Serializable {

    private static final long serialVersionUID = 7528634567769864592L;

    @ApiModelProperty("主键ID")
    private Long id;

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

    @ApiModelProperty("是否允许分摊")
    private Boolean isShare = true;

    @ApiModelProperty("附加参数")
    private String addition;

    @ApiModelProperty("活动集合")
    private List<Activity> activities;

    @ApiModelProperty("活动id集合")
    private List<Long> activityIds;

    @ApiModelProperty("活动对应的策略注册集合")
    private List<StrategyRegister> strategyRegisters;

    @ApiModelProperty("活动对应的策略注册id集合")
    private List<Long> strategyRegisterIds = new ArrayList<>();

    @ApiModelProperty("应用策略后价格变动记录")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();

    public OrderDetailPreviewResult toPreview(){
        OrderDetailPreviewResult dto = new OrderDetailPreviewResult();
        BeanUtil.copyProperties(this,dto);
        return dto;
    }
}
