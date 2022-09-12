package cn.bootx.goods.param.inventory;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/4/22
*/
@Data
@Accessors(chain = true)
@Schema(title = "释放SKU库存参数")
public class UnlockInventoryParam {

    @Schema(description= "skuID")
    private Long skuId;

    @Schema(description= "数量")
    private int count;

    @Schema(description= "token")
    private String token;
}
