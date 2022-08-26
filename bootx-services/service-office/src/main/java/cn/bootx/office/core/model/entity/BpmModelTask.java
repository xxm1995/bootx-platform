package cn.bootx.office.core.model.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpDelEntity;
import cn.bootx.office.core.model.convert.BpmModelTaskConvert;
import cn.bootx.office.dto.model.BpmModelTaskDto;
import cn.bootx.office.param.model.BpmModelTaskParam;
import com.baomidou.mybatisplus.annotation.TableName;
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
@Accessors(chain = true)
@TableName("bpm_model_task")
public class BpmModelTask extends MpDelEntity implements EntityBaseFunction<BpmModelTaskDto>{

    /** 关联模型id */
    private Long modelId;
    /** 流程定义id */
    private String defId;
    /** 流程key */
    private String defKey;
    /** 关联表单id */
    private Long formId;
    /** 任务节点id */
    private String taskId;
    /** 任务节点名称 */
    private String taskName;
    /** 分配类型 */
    private String assignType;
    /** 分配的用户(固定人) */
    private Long userId;

    /** 创建对象 */
    public static BpmModelTask init(BpmModelTaskParam in) {
            return BpmModelTaskConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public BpmModelTaskDto toDto() {
        return BpmModelTaskConvert.CONVERT.convert(this);
    }
}
