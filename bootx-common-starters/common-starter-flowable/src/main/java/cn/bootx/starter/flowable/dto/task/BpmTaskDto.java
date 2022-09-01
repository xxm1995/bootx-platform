package cn.bootx.starter.flowable.dto.task;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * 流程任务扩展
 * @author xxm
 * @date 2022-09-01
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "流程任务扩展")
@Accessors(chain = true)
public class BpmTaskDto extends BaseDto {

    @Schema(description = "任务ID")
    private String taskId;
    @Schema(description = "任务执行 ID")
    private String executionId;
    @Schema(description = "流程实例的id")
    private String instanceId;
    @Schema(description = "流程名称(业务标题)")
    private String instanceName;
    @Schema(description = "流程定义名称")
    private String defName;
    @Schema(description = "任务节点id")
    private String taskNodeId;
    @Schema(description = "任务节点名称")
    private String taskName;
    @Schema(description = "流程任务的状态")
    private String state;
    @Schema(description = "开始时间")
    private LocalDateTime startTime;
    @Schema(description = "结束时间")
    private LocalDateTime endTime;
    @Schema(description = "当前处理人")
    private Long userId;
    @Schema(description = "当前处理人")
    private String userName;
    @Schema(description = "发起人")
    private Long startUserId;
    @Schema(description = "发起人名称")
    private String startUserName;
    @Schema(description = "提交的表单值")
    private Map<String, Object> formVariables;

}