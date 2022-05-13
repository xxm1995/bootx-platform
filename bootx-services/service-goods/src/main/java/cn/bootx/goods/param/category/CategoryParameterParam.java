package cn.bootx.goods.param.category;

import cn.bootx.common.core.validation.ValidationGroup;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

/**
 * 类目参数
 * @author xxm
 * @date 2022-05-09
 */
@Data
@Schema(title = "类目参数")
@Accessors(chain = true)
public class CategoryParameterParam {

    @NotNull(groups = ValidationGroup.edit.class)
    @Schema(description= "主键")
    private Long id;
    @NotNull(groups = ValidationGroup.add.class)
    @Schema(description = "参数名称")
    private String name;
    @NotEmpty
    @Schema(description = "手动输入or列表选择")
    private String type;
    @Schema(description = "选择值(列表)")
    private String options;
    @Schema(description = "是否必填")
    private Boolean required;
    @Schema(description = "排序")
    private Double sortNo;
    @NotNull
    @Schema(description = "参数组id")
    private Long groupId;
    @NotNull
    @Schema(description = "类目id")
    private Long categoryId;
    @Schema(description = "描述")
    private String remark;

}