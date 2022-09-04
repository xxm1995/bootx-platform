package cn.bootx.starter.flowable.dto.instance;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 *
 * @author xxm
 * @date 2022/8/31
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程活动实例(用于绘制流程图)")
public class ActivityInstanceChart {

    @Schema(description = "流程活动的id")
    private String activityId;
    @Schema(description = "流程活动的类型")
    private String activityType;

    @Schema(description = "运行中")
    private boolean running;
}
