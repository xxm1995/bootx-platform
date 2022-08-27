package cn.bootx.starter.flowable.core.instance.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * 任务扩展存储
 * @author xxm
 * @date 2022/8/23
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName(value = "bpm_task",autoResultMap = true)
public class BpmTask extends MpBaseEntity {

    /** 任务id */
    private String taskId;

    /** 执行 ID */
    private String executionId;

    /** 流程id */
    private String instanceId;

    /** 开始时间 */
    private LocalDateTime startTime;

    /** 结束时间 */
    private LocalDateTime endTime;

    /** 提交的表单值 */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private Map<String,Object> formVariables;

    /** 下一步处理人类别 */
    private String assignType;

    /** 下一步处理人 */
    private Long userId;

    /** 下一步处理人 */
    private String userName;
}
