package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 类目参数
 * @author xxm
 * @date 2022-05-09
 */
@Data
@Schema(title = "类目参数")
@Accessors(chain = true)
public class CategoryParameterParam {

    @Schema(description= "主键")
    private Long id;

    @Schema(description = "品牌名称")
    private String name;
    @Schema(description = "选择值(列表)")
    private String options;
    @Schema(description = "是否必填")
    private Boolean required;
    @Schema(description = "排序")
    private Double sortNo;
    @Schema(description = "参数组id")
    private Long groupId;
    @Schema(description = "类目id")
    private Long categoryId;
    @Schema(description = "描述")
    private String remark;

}