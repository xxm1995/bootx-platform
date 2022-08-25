package cn.bootx.office.core.model.entity;

import cn.bootx.common.mybatisplus.base.MpDelEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022/8/25
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("bpm_model_task")
public class BpmModelTask extends MpDelEntity {

    /** 模型id */
    private Long modelId;
    /** 流程定义id */
    private String defId;
    /** 流程key */
    private String defKey;
    /** 分配类型 */
    private String assignType;
    /** 分配的用户 */
}
