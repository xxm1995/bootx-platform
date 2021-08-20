package cn.bootx.sales.dto.coupon;

import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
* @author xxm
* @date 2020/11/1
*/
@Data
@Accessors(chain = true)
@ApiModel("优惠券模板")
public class CouponTemplateDto implements Serializable {
    private static final long serialVersionUID = 1529981112623712342L;

    /** 固定时间 */
    public static final int FIXED_TIME = 1;

    private Long id;

    /** 名称 */
    private String name;

    /** 描述 */
    private String description;

    /** 数量 */
    private Integer num;

    /** 策略注册id */
    private Long strategyRegisterId;

    /** 优惠券互斥 */
    private String couponMutual;

    /** 活动互斥 */
    private String activityMutual;

    /** 有效类型 固定时间段/几天内有效 */
    private int effectiveType;

    /** 时间类型 小时/整天/多少天后*/
    private int timeType;

    /** 有效时间 */
    private Long effectiveTime;

    /** 有效开始时间 */
    private LocalDateTime startTime;

    /** 有效结束时间 */
    private LocalDateTime endTime;

    private StrategyRegisterDto strategyRegister;
}
