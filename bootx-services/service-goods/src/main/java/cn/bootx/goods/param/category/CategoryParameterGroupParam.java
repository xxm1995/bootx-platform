package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 类目参数组
 * @author xxm
 * @date 2022-05-09
 */
@Data
@Schema(title = "类目参数组")
@Accessors(chain = true)
public class CategoryParameterGroupParam {

    @Schema(description= "主键")
    private Long id;

    @Schema(description = "品牌名称")
    private String name;
    @Schema(description = "排序")
    private Double sortNo;
    @Schema(description = "类目id")
    private Long categoryId;
    @Schema(description = "描述")
    private String remark;

}