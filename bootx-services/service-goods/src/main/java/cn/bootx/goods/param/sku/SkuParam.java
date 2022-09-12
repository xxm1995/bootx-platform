package cn.bootx.goods.param.sku;

import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
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

    @Schema(description= "主键")
    private Long id;

    @Schema(description= "所属类目id")
    private Long cid;

    @Schema(description= "外部编码")
    private String outNo;

    @Schema(description= "所属商品id")
    private Long goodsId;

    @Schema(description= "SKU名称")
    private String name;

    @Schema(description= "SKU描述")
    private String description;

    @Schema(description= "附加信息")
    private String addition;

    @Schema(description= "是否打包品")
    private boolean packing;

    @Schema(description= "是否无限库存")
    private boolean unlimited;

    @Schema(description= "初始库存")
    private Integer capacity;

    @Schema(description= "售价")
    private BigDecimal price;

}
