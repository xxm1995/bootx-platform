package cn.bootx.office.core.model.entity;

import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.office.core.model.convert.BpmModelConvert;
import cn.bootx.office.dto.model.BpmModelDto;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.v3.oas.annotations.media.Schema;
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

    @Schema(description ="名称")
    private String name;
    @Schema(description ="流程类型")
    private String modelType;
    @Schema(description ="发布状态")
    private String publish;
    @Schema(description ="启用状态")
    private Boolean enable;
    @Schema(description ="部署id")
    private String deployId;
    @Schema(description ="流程定义id")
    private String defId;
    @Schema(description ="流程key")
    private String defKey;
    @Schema(description ="流程名称")
    private String defName;
    @Schema(description ="流程备注")
    private String defRemark;
    @Schema(description ="是否主流程")
    private Boolean mainProcess;
    @Schema(description ="流程版本号")
    private Integer processVersion;
    @BigField
    @Schema(description ="流程xml")
    private String modelEditorXml;
    @Schema(description ="备注")
    private String remark;


    /** 转换成dto */
    @Override
    public BpmModelDto toDto() {
        return BpmModelConvert.CONVERT.convert(this);
    }

}
