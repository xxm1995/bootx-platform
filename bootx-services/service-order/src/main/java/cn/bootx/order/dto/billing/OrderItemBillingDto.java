package cn.bootx.order.dto.billing;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
* @author xxm
* @date 2020/12/9
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel(value = "订单详情账单")
public class OrderItemBillingDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = -5696250791473519741L;

    @ApiModelProperty(value = "账单id")
    private Long orderBillingId;

    @ApiModelProperty(value = "用户id")
    private Long userId;

    @ApiModelProperty(value = "订单id")
    private Long orderId;

    @ApiModelProperty(value = "订单项id")
    private Long orderItemId;

    @ApiModelProperty(value = "订单项目skuId")
    private Long orderItemSkuId;

    /**
     * @see PayTransactionPurposeCode
     */
    @ApiModelProperty(value = "交易目的")
    private int transactionPurpose;

    /**
     * @see PayTransactionTypeCode
     */
    @ApiModelProperty(value = "交易类型")
    private int transactionType;

    @ApiModelProperty(value = "支付类型")
    private int payType;

    @ApiModelProperty(value = "支付金额")
    private BigDecimal amount;

    @ApiModelProperty(value = "使用数量")
    private int count;

    @ApiModelProperty(value = "入账时间")
    private Long bookkeepingTime;

}
