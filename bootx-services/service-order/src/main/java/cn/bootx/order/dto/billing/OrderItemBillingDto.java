package cn.bootx.order.dto.billing;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(title = "订单详情账单")
public class OrderItemBillingDto extends BaseDto implements Serializable {

    private static final long serialVersionUID = -5696250791473519741L;

    @Schema(description= "账单id")
    private Long orderBillingId;

    @Schema(description= "用户id")
    private Long userId;

    @Schema(description= "订单id")
    private Long orderId;

    @Schema(description= "订单项id")
    private Long orderItemId;

    @Schema(description= "订单项目skuId")
    private Long orderItemSkuId;

    /**
     * @see PayTransactionPurposeCode
     */
    @Schema(description= "交易目的")
    private int transactionPurpose;

    /**
     * @see PayTransactionTypeCode
     */
    @Schema(description= "交易类型")
    private int transactionType;

    @Schema(description= "支付类型")
    private int payType;

    @Schema(description= "支付金额")
    private BigDecimal amount;

    @Schema(description= "使用数量")
    private int count;

    @Schema(description= "入账时间")
    private Long bookkeepingTime;

}
