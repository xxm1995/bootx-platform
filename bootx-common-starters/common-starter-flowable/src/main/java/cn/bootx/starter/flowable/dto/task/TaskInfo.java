package cn.bootx.starter.flowable.dto.task;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 流程任务扩展
 *
 * @author xxm
 * @date 2022/8/28
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程任务信息")
public class TaskInfo {

    @Schema(description = "任务id")
    private String taskId;

    @Schema(description = "执行 ID")
    private String executionId;

    @Schema(description = "实例ID")
    private String instanceId;

    @Schema(description = "流程名称(业务标题)")
    private String instanceName;

    @Schema(description = "流程定义名称")
    private String defName;

    @Schema(description = "当前环节名称")
    private String nodeName;

    @Schema(description = "流程任务的状态")
    private String state;

    @Schema(description = "处理人")
    private Long userId;

    @Schema(description = "处理人")
    private String userName;

    @Schema(description = "流程发起人id")
    private Long startUserId;

    @Schema(description = "流程发起人名称")
    private String startUserName;

    @Schema(description = "开始时间")
    private LocalDateTime startTime;

    @Schema(description = "结束时间")
    private LocalDateTime endTime;

}
