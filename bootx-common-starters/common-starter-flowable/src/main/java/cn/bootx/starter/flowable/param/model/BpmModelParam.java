package cn.bootx.starter.flowable.param.model;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * @author xxm
 * @date 2022/8/23
 */
@Data
@Accessors(chain = true)
@Schema(title = "流程模型参数")
public class BpmModelParam {

    @Schema(description = "主键")
    private Long id;

    @Schema(description = "流程名称")
    private String name;

    @Schema(description = "流程类型(相当于flowable的分类)")
    private String modelType;

    @Schema(description = "关联动态表单id")
    private Long formId;

    @Schema(description = "备注")
    private String remark;

    @Schema(description = "流程xml")
    private String modelEditorXml;

}
