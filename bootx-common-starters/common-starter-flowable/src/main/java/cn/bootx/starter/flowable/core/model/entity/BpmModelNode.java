package cn.bootx.starter.flowable.core.model.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpDelEntity;
import cn.bootx.common.mybatisplus.handler.JacksonRawTypeHandler;
import cn.bootx.starter.flowable.core.model.convert.BpmModelNodeConvert;
import cn.bootx.starter.flowable.dto.model.BpmModelNodeDto;
import cn.bootx.starter.flowable.param.model.BpmModelNodeParam;
import com.baomidou.mybatisplus.annotation.FieldStrategy;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import lombok.experimental.FieldNameConstants;

/**
* 模型任务节点配置
* @author xxm
* @date 2022-08-25
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@FieldNameConstants
@TableName(value = "bpm_model_node",autoResultMap = true)
public class BpmModelNode extends MpDelEntity implements EntityBaseFunction<BpmModelNodeDto>{

    /** 关联模型id */
    private Long modelId;
    /** 流程定义id */
    private String defId;
    /** 流程key */
    private String defKey;
    /** 关联表单id */
    private Long formId;
    /** 任务节点id */
    private String nodeId;
    /** 任务节点名称 */
    private String nodeName;

    /** 是否多实例 */
    private boolean multi;
    /** 是否串签 */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private Boolean sequential;
    /** 是否是或签, 会签情况下使用,一个同意的直接通过这个任务 */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private Boolean orSign;
    /** 是否比例通过 会签情况下使用 */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private Boolean ratioPass;
    /** 通过比例 */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private Double passRatio;

    /** 是否自动跳过当前节点(通常用于开始节点) */
    private boolean skip;
    /** 是否允许驳回 */
    private boolean reject;
    /** 是否允许回退 */
    private boolean back;
    /** 是否允许取回 */
    private boolean retrieve;
    /**
     * 分配类型
     * @see cn.bootx.starter.flowable.code.ModelNodeCode
     */
    private String assignType;
    /** 分配的原始数据 */
    @TableField(typeHandler = JacksonRawTypeHandler.class, updateStrategy = FieldStrategy.IGNORED)
    private Object assignRaw;
    /** 分配的数据的展示 */
    @TableField(updateStrategy = FieldStrategy.IGNORED)
    private String assignShow;
    /** 创建对象 */
    public static BpmModelNode init(BpmModelNodeParam in) {
            return BpmModelNodeConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public BpmModelNodeDto toDto() {
        return BpmModelNodeConvert.CONVERT.convert(this);
    }
}
