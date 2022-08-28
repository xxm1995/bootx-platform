package cn.bootx.starter.flowable.dto.task;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**   
 * 流程任务扩展
 * @author xxm  
 * @date 2022/8/28 
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程任务信息")
public class TaskInfo {

    /** 任务id */
    private String taskId;

    /** 执行 ID */
    private String executionId;

    /** 实例ID */
    private String instanceId;

    /** 流程名称(业务标题) */
    private String instanceName;

    /** 流程定义名称 */
    private String defName;

    /** 当前环节名称 */
    private String taskName;

    /** 处理人 */
    private Long userId;

    /** 处理人 */
    private String userName;

    /** 流程发起人id */
    private Long startUserId;

    /** 流程发起人名称 */
    private String startUserName;

    /** 开始时间 */
    private LocalDateTime startTime;

    /** 结束时间 */
    private LocalDateTime endTime;
}
