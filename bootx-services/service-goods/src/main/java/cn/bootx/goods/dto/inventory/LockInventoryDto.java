package cn.bootx.goods.dto.inventory;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/11/21
*/
@Data
@Accessors(chain = true)
@ApiModel("库存锁定")
public class LockInventoryDto implements Serializable {
    private static final long serialVersionUID = 7373301471799658911L;
    @ApiModelProperty("锁库存token")
    private String token;

    @ApiModelProperty("锁定库存的起始顺序号")
    private Integer startIndex;

    @ApiModelProperty("锁定总数")
    private Integer count;

}
