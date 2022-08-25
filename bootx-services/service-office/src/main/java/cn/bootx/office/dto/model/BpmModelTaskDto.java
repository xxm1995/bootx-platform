package cn.bootx.office.dto.model;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022-08-25
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "模型任务节点配置")
@Accessors(chain = true)
public class BpmModelTaskDto extends BaseDto {

    @Schema(description = "关联模型id")
    private Long modelId;
    @Schema(description = "流程定义id")
    private String defId;
    @Schema(description = "流程key")
    private String defKey;
    @Schema(description = "任务节点id")
    private String taskId;
    @Schema(description = "任务节点名称")
    private String taskName;
    @Schema(description = "分配类型")
    private String assignType;
    @Schema(description = "分配的用户(固定人)")
    private Long userId;

}