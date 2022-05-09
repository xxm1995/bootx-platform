package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 规格
 * @author xxm
 * @date 2022-05-09
 */
@Data
@Schema(title = "规格")
@Accessors(chain = true)
public class SpecificationParam {

    @Schema(description= "主键")
    private Long id;

    @Schema(description = "规格名称")
    private String name;
    @Schema(description = "规格值")
    private String values;
    @Schema(description = "状态")
    private String state;
    @Schema(description = "描述")
    private String remark;

}