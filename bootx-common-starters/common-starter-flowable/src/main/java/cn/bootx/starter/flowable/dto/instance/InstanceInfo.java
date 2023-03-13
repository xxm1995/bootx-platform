package cn.bootx.starter.flowable.dto.instance;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * 流程实例信息
 *
 * @author xxm
 * @date 2022/8/27
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程实例信息")
public class InstanceInfo {

    @Schema(description = "标题")
    private String name;

    @Schema(description = "实例ID")
    private String instanceId;

    @Schema(description = "流程定义名称")
    private String defMame;

    @Schema(description = "流程实例的状态")
    private String state;

    @Schema(description = "开始时间")
    private LocalDateTime startTime;

    @Schema(description = "结束时间")
    private LocalDateTime endTime;

    @Schema(description = "发起人id")
    private Long startUserId;

    @Schema(description = "发起人名称")
    private String startUserName;

}
