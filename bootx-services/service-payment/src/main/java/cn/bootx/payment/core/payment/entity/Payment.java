package cn.bootx.payment.core.payment.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.convert.PaymentConvert;
import cn.bootx.payment.dto.payment.PayChannelInfo;
import cn.bootx.payment.dto.payment.PaymentDto;
import cn.bootx.payment.dto.payment.RefundableInfo;
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
* 支付记录
* @author xxm
* @date 2020/12/8
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("pc_payment")
public class Payment extends MpBaseEntity implements EntityBaseFunction<PaymentDto> {

    /** 关联的业务id */
    private String businessId;

    /** 用户ID */
    private Long userId;

    /** 标题 */
    private String title;

    /** 描述 */
    private String description;

    /** 是否是异步支付 */
    private boolean syncPayMode;

    /** 异步支付方式(支付通道) */
    private Integer syncPayWay;

    /** 金额 */
    private BigDecimal amount;

    /** 可退款余额 */
    private BigDecimal refundableBalance;

    /** 错误码 */
    private String errorCode;

    /** 错误信息 */
    private String errorMsg;

    /**
     * 支付通道信息列表
     * @see PayChannelInfo
     */
    private String payChannelInfo;

    /**
     * 退款信息列表
     * @see cn.bootx.payment.dto.payment.RefundableInfo
     */
    private String refundableInfo;

    /**
     * 支付状态
     * @see PayStatusCode
     */
    private Integer payStatus;

    /** 支付时间 */
    private LocalDateTime payTime;

    /** 支付终端ip */
    private String clientIp;

    /** 超时时间 */
    private LocalDateTime expiredTime;

    @Override
    public PaymentDto toDto() {
        return PaymentConvert.CONVERT.convert(this);
    }

    /**
     * 获取支付通道
     */
    public List<PayChannelInfo> getPayChannelInfoList(){
        if (StrUtil.isNotBlank(this.payChannelInfo)){
            JSONArray array = JSONUtil.parseArray(this.payChannelInfo);
            return JSONUtil.toList(array, PayChannelInfo.class);
        }
        return new ArrayList<>(0);
    }

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
}
