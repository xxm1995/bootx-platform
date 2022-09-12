package cn.bootx.sales.param.coupon;

import cn.bootx.sales.param.strategy.CheckRuleParam;
import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import cn.hutool.core.date.DatePattern;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
* @author xxm
* @date 2020/11/1
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "优惠券模板参数")
public class CouponTemplateParam extends StrategyRegisterParam implements Serializable {
    private static final long serialVersionUID = 7480182214926404754L;

    @Schema(description= "数量")
    private Integer num;

    @Schema(description= "优惠券互斥(模板id)")
    private List<String> couponMutual;

    @Schema(description= "活动互斥(活动id)")
    private List<String> activityMutual;

    @Schema(description= "领取检查规则")
    private List<CheckRuleParam> obtainRules;

    @Schema(description= "有效类型 固定时间段/几天内有效")
    private int effectiveType;

    @Schema(description= "时间类型 小时/整天/多少天后")
    private int timeType;

    @Schema(description= "有效时间")
    private Long effectiveTime;

    @Schema(description= "有效开始时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime startTime;

    @Schema(description= "有效结束时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endTime;

}
