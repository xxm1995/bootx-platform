package cn.bootx.sales.core.coupon.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.sales.core.coupon.convert.CouponConvert;
import cn.bootx.sales.dto.coupon.CouponDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 优惠券策略
 * @author xxm
 * @date 2020/10/19
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("sc_coupon")
public class Coupon extends MpBaseEntity implements EntityBaseFunction<CouponDto> {

    /** 名称 */
    private String name;

    /** 描述 */
    private String description;

    /** 模板id */
    private Long templateId;

    /** 策略注册id */
    private Long strategyRegisterId;

    /** 有效开始时间 */
    private LocalDateTime startTime;

    /** 有效结束时间 */
    private LocalDateTime endTime;

    /** 状态 */
    private int status;

    /** 用于的订单 */
    private Long orderId;

    /** 领取时间 */
    private LocalDateTime obtainTime;

    /** 使用时间 */
    private LocalDateTime usedTime;

    /** 用户id */
    private Long userId;

    public static Coupon init(CouponDto dto){
        return CouponConvert.INSTANCE.convert(dto);
    }

    @Override
    public CouponDto toDto() {
        return CouponConvert.INSTANCE.convert(this);

    }
}
