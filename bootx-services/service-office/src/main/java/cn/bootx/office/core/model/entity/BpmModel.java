package cn.bootx.office.core.model.entity;

import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.office.core.model.convert.BpmModelConvert;
import cn.bootx.office.dto.model.BpmModelDto;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 流程模型
* @author xxm
* @date 2020/2/28 19:44
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("bpm_model")
public class BpmModel extends MpBaseEntity implements EntityBaseFunction<BpmModelDto> {

    /** 名称 */
    private String name;
    /** 流程类型 */
    private String modelType;
    /** 关联表单id */
    private Long formId;
    /** 发布状态 */
    private String publish;
    /** 启用状态 */
    private Boolean enable;
    /** 部署id */
    private String deployId;
    /** 流程定义id */
    private String defId;
    /** 流程key */
    private String defKey;
    /** 流程名称 */
    private String defName;
    /** 流程备注 */
    private String defRemark;
    /** 是否主流程 */
    private Boolean mainProcess;
    /** 流程版本号 */
    private Integer processVersion;
    /** 流程xml */
    @BigField
    private String modelEditorXml;
    /** 备注 */
    private String remark;


    /** 转换成dto */
    @Override
    public BpmModelDto toDto() {
        return BpmModelConvert.CONVERT.convert(this);
    }

}
