package cn.bootx.goods.param.inventory;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

/**
* @author xxm
* @date 2021/4/29
*/
@Data
@Accessors(chain = true)
@ApiModel("减少SKU库存参数")
public class ReduceInventoryParam {

    @ApiModelProperty("skuID")
    private Long skuId;

    @ApiModelProperty("数量")
    private int count;

    @ApiModelProperty("token")
    private String token;
}
