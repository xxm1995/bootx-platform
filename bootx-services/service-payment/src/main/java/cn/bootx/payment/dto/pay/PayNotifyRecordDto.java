package cn.bootx.payment.dto.pay;

import cn.bootx.payment.code.pay.PayStatusCode;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2021/6/22
*/
@Data
@Accessors(chain = true)
@ApiModel("支付回调记录")
public class PayNotifyRecordDto implements Serializable {
    private static final long serialVersionUID = -1241346974397068912L;

    private Long id;

    /**
     * 支付号
     */
    private Long paymentId;

    /**
     * 通知消息
     */
    private String notify;

    /**
     * 处理状态
     * @see PayStatusCode
     */
    private int code;

    /** 提示信息 */
    private String msg;

    /**
     * 回调时间
     */
    private LocalDateTime notifyTime;

}
