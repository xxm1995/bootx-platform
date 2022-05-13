package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.util.List;

/**   
* @author xxm
* @date 2022/5/13 
*/
@Data
@Accessors(chain = true)
@Schema(title = "类目规格绑定")
public class CategorySpecParam {
    @NotNull
    @Schema(description = "类目id")
    private Long categoryId;

    @Schema(description = "品牌ids")
    private List<Long> specIds;
}
