package cn.bootx.payment.core.refund.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.payment.core.refund.convert.RefundConvert;
import cn.bootx.payment.dto.payment.RefundableInfo;
import cn.bootx.payment.dto.refund.RefundRecordDto;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**   
* 退款记录
* @author xxm  
* @date 2022/3/2 
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pc_refund_record")
public class RefundRecord extends MpBaseEntity implements EntityBaseFunction<RefundRecordDto>{

    /** 退款订单号 */
    private String refundOrderId;

    /** 支付单号 */
    private Long paymentId;

    /** 用户ID */
    private Long userId;

    /** 标题 */
    private String title;

    /** 金额 */
    private BigDecimal amount;

    /** 退款终端ip */
    private String clientIp;

    /** 退款时间 */
    private LocalDateTime refundTime;
    /**
     * 退款信息列表
     * @see cn.bootx.payment.dto.payment.RefundableInfo
     */
    private String refundableInfo;

    /** 退款状态 */
    private int refundStatus;

    /** 错误码 */
    private String errorCode;

    /** 错误信息 */
    private String errorMsg;

    /**
     * 获取可退款信息列表
     */
    public List<RefundableInfo> getRefundableInfoList(){
        if (StrUtil.isNotBlank(this.refundableInfo)){
            JSONArray array = JSONUtil.parseArray(this.refundableInfo);
            return JSONUtil.toList(array, RefundableInfo.class);
        }
        return new ArrayList<>(0);
    }

    @Override
    public RefundRecordDto toDto() {
        return RefundConvert.CONVERT.convert(this);
    }
}
