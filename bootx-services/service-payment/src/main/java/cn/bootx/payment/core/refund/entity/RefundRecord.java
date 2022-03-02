package cn.bootx.payment.core.refund.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**   
* 退款记录
* @author xxm  
* @date 2022/3/2 
*/
@Data
@Accessors(chain = true)
@TableName("pc_refund_record")
public class RefundRecord {

    /** 退款订单号 */
    private String refundOrderId;

    /** 支付单号 */
    private Long paymentId;

    /** 用户ID */
    private Long userId;

    /** 标题 */
    private String title;

    /** 支付通道 */
    private int payChannel;

    /** 支付方式 */
    private int payWay;

    /** 数量 */
    private int count;

    /** 金额 */
    private BigDecimal amount;

    /** 退款终端ip */
    private String clientIp;

    /** 退款时间 */
    private LocalDateTime refundTime;

    /** 退款状态 */
    private int refundStatus;

    /** 错误码 */
    private String errorCode;

    /** 错误信息 */
    private String errorMsg;
}
