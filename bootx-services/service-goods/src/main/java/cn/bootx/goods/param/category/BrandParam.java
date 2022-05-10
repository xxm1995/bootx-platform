package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 品牌
 * @author xxm
 * @date 2022-05-09
 */
@Data
@Schema(title = "品牌")
@Accessors(chain = true)
public class BrandParam {

    @Schema(description= "品牌主键")
    private Long id;
    @Schema(description = "类目名称")
    private String name;
    @Schema(description = "品牌图标")
    private String logo;
    @Schema(description = "是否启用")
    private Boolean enable;
    @Schema(description = "描述")
    private String remark;

}