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

    @Schema(name = "主键ID")
    private Long id;

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

    @Schema(name = "是否允许分摊")
    private Boolean isShare = true;

    @Schema(name = "附加参数")
    private String addition;

    @Schema(name = "活动集合")
    private List<Activity> activities;

    @Schema(name = "活动id集合")
    private List<Long> activityIds;

    @Schema(name = "活动对应的策略注册集合")
    private List<StrategyRegister> strategyRegisters;

    @Schema(name = "活动对应的策略注册id集合")
    private List<Long> strategyRegisterIds = new ArrayList<>();

    @Schema(name = "应用策略后价格变动记录")
    private List<OrderStrategyMappingResult> mappings = new ArrayList<>();

    public OrderDetailPreviewResult toPreview(){
        OrderDetailPreviewResult dto = new OrderDetailPreviewResult();
        BeanUtil.copyProperties(this,dto);
        return dto;
    }
}
