package cn.bootx.sales.param.activity;

import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import cn.hutool.core.date.DatePattern;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
* @author xxm
* @date 2021/5/7
*/
@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("活动参数")
public class ActivityParam extends StrategyRegisterParam {

    @ApiModelProperty("有效开始时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime startTime;

    @ApiModelProperty("有效结束时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endTime;
}
