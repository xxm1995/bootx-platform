package cn.bootx.office.dto.instance;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * 流程实例扩展
 * @author xxm
 * @date 2022-08-23
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "流程实例扩展")
@Accessors(chain = true)
public class BpmInstanceDto extends BaseDto {

    @Schema(description = "关联模型id")
    private Long flowModelId;
    @Schema(description = "流程实例的id")
    private String instanceId;
    @Schema(description = "流程定义的id")
    private String defId;
    @Schema(description = "流程定义的名称")
    private String defName;
    @Schema(description = "流程分类")
    private String modelType;
    @Schema(description = "发起人")
    private Long startUserId;
    @Schema(description = "流程实例的状态")
    private String state;
    @Schema(description = "流程实例的执行结果")
    private String result;
    @Schema(description = "开始时间")
    private LocalDateTime startTime;
    @Schema(description = "结束时间")
    private LocalDateTime endTime;
    @Schema(description = "提交的表单值")
    private Map<String,Object> formVariables;

}