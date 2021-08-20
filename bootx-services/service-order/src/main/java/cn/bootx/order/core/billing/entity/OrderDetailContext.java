package cn.bootx.order.core.billing.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.List;

/**   
* 订单详情的上下文，将原来的订单详情，
 * 转换为更适合我们的格式，同时屏蔽各种不同的订单详情的差异化
* @author xxm  
* @date 2020/12/9 
*/
@Data
@Accessors(chain = true)
public class OrderDetailContext {

    /**
     * ID != order detail id
     * 因为多个项目会共用一个相同的order detail id 所以此处重新生成，保证每个都不一致。
     */
    private Long id;

    /**
     * 订单详情的id
     */
    private Long orderDetailId;

    /**
     * 对应的skuId
     */
    private Long skuId;

    /**
     * 支付金额
     */
    private BigDecimal payAmount;

    /**
     * 已经记账的金额
     */
    private BigDecimal recordedAmount;

    /**
     * 该订单项目不支持的payMode列表，部分订单详情可能不支持某种支付方式，拆分的时候需要过滤的
     */
    private List<Integer> unSupportPayModeList;

    /**
     * 交易目的
     * @see PayTransactionPurposeCode
     */
    private int transactionPurpose;

    /**
     * 交易类型
     * @see PayTransactionTypeCode
     */
    private int transactionType;

    /**
     * 剩余的记账金额
     * @return 这个order detail 剩余的记账金额
     */
    public BigDecimal getRemainingAmount() {
        return this.getPayAmount().subtract(this.getRecordedAmount());
    }
}
