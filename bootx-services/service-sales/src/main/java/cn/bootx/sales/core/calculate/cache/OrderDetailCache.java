package cn.bootx.sales.core.calculate.cache;

import cn.bootx.sales.core.activity.entity.Activity;
import cn.bootx.sales.core.strategy.entity.StrategyRegister;
import cn.bootx.sales.dto.order.OrderDetailPreviewResult;
import cn.bootx.sales.dto.order.OrderStrategyMappingResult;
import cn.hutool.core.bean.BeanUtil;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "订单计算缓存明细对象")
public class OrderDetailCache implements Serializable {

    private static final long serialVersionUID = 7528634567769864592L;

    @Schema(description= "主键ID")
    private Long id;

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

    @Schema(description= "是否允许分摊")
    private Boolean isShare = true;

    @Schema(description= "附加参数")
    private String addition;

    @Schema(description= "活动集合")
    private List<Activity> activities;

    @Schema(description= "活动id集合")
    private List<Long> activityIds;

    @Schema(description= "活动对应的策略注册集合")
    private List<StrategyRegister> strategyRegisters;

    @Schema(description= "活动对应的策略注册id集合")
    private List<Long> strategyRegisterIds = new ArrayList<>();

    @Schema(description= "应用策略后价格变动记录")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();

    public OrderDetailPreviewResult toPreview(){
        OrderDetailPreviewResult dto = new OrderDetailPreviewResult();
        BeanUtil.copyProperties(this,dto);
        return dto;
    }
}
