package cn.bootx.goods.param.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotNull;
import java.util.List;

/**   
* 类目绑定品牌参数
* @author xxm  
* @date 2022/5/13 
*/
@Data
@Accessors(chain = true)
@Schema(title = "类目绑定品牌参数")
public class CategoryBrandParam {

    @NotNull
    @Schema(description = "类目id")
    private Long categoryId;

    @Schema(description = "品牌ids")
    private List<Long> brandIds;
}
