package cn.bootx.goods.dto.inventory;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author xxm
* @date 2020/11/21
*/
@Data
@Accessors(chain = true)
@Schema(title = "库存锁定")
public class LockInventoryDto implements Serializable {
    private static final long serialVersionUID = 7373301471799658911L;
    @Schema(description= "锁库存token")
    private String token;

    @Schema(description= "锁定库存的起始顺序号")
    private Integer startIndex;

    @Schema(description= "锁定总数")
    private Integer count;

}
