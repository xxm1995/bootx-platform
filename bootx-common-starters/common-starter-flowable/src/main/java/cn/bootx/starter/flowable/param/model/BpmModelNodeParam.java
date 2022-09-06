package cn.bootx.starter.flowable.param.model;

import cn.bootx.common.mybatisplus.handler.JacksonRawTypeHandler;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022-08-25
 */
@Data
@Schema(title = "模型任务节点配置")
@Accessors(chain = true)
public class BpmModelNodeParam {

    @Schema(description= "主键")
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
    @Schema(description = "是否会签")
    private boolean multi;
    /** 是否自动跳过当前节点(通常用于开始节点) */
    private boolean skip;
    /** 是否允许驳回 */
    private boolean reject;
    /** 是否允许回退 */
    private boolean back;
    /** 是否允许取回 */
    private boolean retrieve;
    @Schema(description = "分配类型")
    private String assignType;
    /** 分配的原始数据 */
    private Object assignRaw;
    /** 分配的数据的展示 */
    private String assignShow;

}