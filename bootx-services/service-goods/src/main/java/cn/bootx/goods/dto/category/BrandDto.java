package cn.bootx.goods.dto.category;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 品牌
 * @author xxm
 * @date 2022-05-09
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Schema(title = "品牌")
@Accessors(chain = true)
public class BrandDto extends BaseDto {

    @Schema(description = "品牌名称")
    private String name;
    @Schema(description = "品牌图标")
    private String logo;
    @Schema(description = "状态")
    private String state;
    @Schema(description = "描述")
    private String remark;

}