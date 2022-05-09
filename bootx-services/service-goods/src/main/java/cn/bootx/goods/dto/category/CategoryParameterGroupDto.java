package cn.bootx.goods.dto.category;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 类目参数组
 * @author xxm
 * @date 2022-05-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "类目参数组")
@Accessors(chain = true)
public class CategoryParameterGroupDto extends BaseDto {

    @Schema(description = "品牌名称")
    private String name;
    @Schema(description = "排序")
    private Double sortNo;
    @Schema(description = "类目id")
    private Long categoryId;
    @Schema(description = "描述")
    private String remark;

}