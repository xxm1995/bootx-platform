package cn.bootx.sales.param.coupon;

import cn.bootx.sales.param.strategy.CheckRuleParam;
import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import cn.hutool.core.date.DatePattern;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("优惠券模板参数")
public class CouponTemplateParam extends StrategyRegisterParam implements Serializable {
    private static final long serialVersionUID = 7480182214926404754L;

    @ApiModelProperty("数量")
    private Integer num;

    @ApiModelProperty("优惠券互斥(模板id)")
    private List<String> couponMutual;

    @ApiModelProperty("活动互斥(活动id)")
    private List<String> activityMutual;

    @ApiModelProperty("领取检查规则")
    private List<CheckRuleParam> obtainRules;

    @ApiModelProperty("有效类型 固定时间段/几天内有效")
    private int effectiveType;

    @ApiModelProperty("时间类型 小时/整天/多少天后")
    private int timeType;

    @ApiModelProperty("有效时间")
    private Long effectiveTime;

    @ApiModelProperty("有效开始时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime startTime;

    @ApiModelProperty("有效结束时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endTime;

}
