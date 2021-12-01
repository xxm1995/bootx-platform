package cn.bootx.goods.param.sku;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**   
* @author xxm
* @date 2021/7/23 
*/
@Data
@Accessors(chain = true)
@Schema(title = "sku添加")
public class SkuParam implements Serializable {
    private static final long serialVersionUID = -8038996282288514501L;

    @Schema(name = "主键")
    private Long id;

    @Schema(name = "所属类目id")
    private Long cid;

    @Schema(name = "外部编码")
    private String outNo;

    @Schema(name = "所属商品id")
    private Long goodsId;

    @Schema(name = "SKU名称")
    private String name;

    @Schema(name = "SKU描述")
    private String description;

    @Schema(name = "附加信息")
    private String addition;

    @Schema(name = "是否打包品")
    private boolean packing;

    @Schema(name = "是否无限库存")
    private boolean unlimited;

    @Schema(name = "初始库存")
    private Integer capacity;

    @Schema(name = "售价")
    private BigDecimal price;

}
