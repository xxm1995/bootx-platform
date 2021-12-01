package cn.bootx.sales.param.activity;

import cn.bootx.sales.param.strategy.StrategyRegisterParam;
import cn.hutool.core.date.DatePattern;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "活动参数")
public class ActivityParam extends StrategyRegisterParam {

    @Schema(name = "有效开始时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime startTime;

    @Schema(name = "有效结束时间")
    @DateTimeFormat(pattern = DatePattern.NORM_DATETIME_PATTERN)
    private LocalDateTime endTime;
}
