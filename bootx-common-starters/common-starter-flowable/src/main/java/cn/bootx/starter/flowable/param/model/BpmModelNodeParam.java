package cn.bootx.starter.flowable.param.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 模型任务节点配置
 *
 * @author xxm
 * @date 2022-08-25
 */
@Data
@Schema(title = "模型任务节点配置")
@Accessors(chain = true)
public class BpmModelNodeParam {

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "关联模型id")
    private Long modelId;

    @Schema(description = "流程定义id")
    private String defId;

    @Schema(description = "流程key")
    private String defKey;

    @Schema(description = "任务节点id")
    private String nodeId;

    @Schema(description = "任务节点名称")
    private String nodeName;

    @Schema(description = "是否多实例")
    private boolean multi;

    @Schema(description = "是否串签")
    private boolean sequential;

    /** 是否是或签, 会签情况下使用,一个同意的直接通过这个任务 */
    private Boolean orSign;

    /** 是否比例通过 会签情况下使用 */
    private Boolean ratioPass;

    /** 通过比例 */
    private Double passRatio;

    @Schema(description = "是否自动跳过当前节点(通常用于开始节点)")
    private boolean skip;

    @Schema(description = "是否允许驳回")
    private boolean reject;

    @Schema(description = "是否允许回退")
    private boolean back;

    @Schema(description = "是否允许取回")
    private boolean retrieve;

    @Schema(description = "分配类型")
    private String assignType;

    @Schema(description = "分配的原始数据")
    private Object assignRaw;

    @Schema(description = "分配的数据的展示")
    private String assignShow;

}