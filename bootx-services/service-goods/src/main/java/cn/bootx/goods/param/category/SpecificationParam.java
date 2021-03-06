package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.List;

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
    @Schema(description = "类型")
    private String type;
    @Schema(description = "列表选择值")
    private List<String> options;
    @Schema(description = "状态")
    private String state;
    @Schema(description = "描述")
    private String remark;

}