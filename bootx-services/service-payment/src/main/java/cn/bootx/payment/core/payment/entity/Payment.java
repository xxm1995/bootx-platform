package cn.bootx.payment.core.payment.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.payment.code.pay.PayStatusCode;
import cn.bootx.payment.core.payment.convert.PaymentConvert;
import cn.bootx.payment.dto.pay.PayChannelInfo;
import cn.bootx.payment.dto.payment.PaymentDto;
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
    private Integer syncPayTypeCode;

    /** 金额 */
    private BigDecimal amount;

    /** 错误码 */
    private String errorCode;

    /**
     * 支付通道信息列表
     * @see PayChannelInfo
     */
    private String payChannelInfo;

    /**
     * 支付状态
     * @see PayStatusCode
     */
    private Integer payStatus;

    /** 支付时间 */
    private LocalDateTime payTime;

    @Override
    public PaymentDto toDto() {
        return PaymentConvert.CONVERT.convert(this);
    }

    /**
     * 获取支付类型
     */
    public List<PayChannelInfo> getPayTypeInfos(){
        if (StrUtil.isNotBlank(this.payChannelInfo)){
            JSONArray array = JSONUtil.parseArray(this.payChannelInfo);
            return JSONUtil.toList(array, PayChannelInfo.class);
        }
        return new ArrayList<>(0);
    }
}
