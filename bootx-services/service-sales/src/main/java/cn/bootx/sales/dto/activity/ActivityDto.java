package cn.bootx.sales.dto.activity;

import cn.bootx.sales.dto.strategy.StrategyRegisterDto;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.time.LocalDateTime;

/**
* @author xxm
* @date 2021/5/7
*/
@EqualsAndHashCode(callSuper = true)
@Data
@ApiModel("活动")
public class ActivityDto extends StrategyRegisterDto {

    /** 有效开始时间 */
    private LocalDateTime startTime;

    /** 有效结束时间 */
    private LocalDateTime endTime;

    /** 活动互斥 */
    private String activityMutual;
}
