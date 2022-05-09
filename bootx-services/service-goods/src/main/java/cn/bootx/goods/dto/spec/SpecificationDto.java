package cn.bootx.goods.dto.spec;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 规格
 * @author xxm
 * @date 2022-05-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "规格")
@Accessors(chain = true)
public class SpecificationDto extends BaseDto {

    @Schema(description = "规格名称")
    private String name;
    @Schema(description = "规格值")
    private String values;
    @Schema(description = "状态")
    private String state;
    @Schema(description = "描述")
    private String remark;

}