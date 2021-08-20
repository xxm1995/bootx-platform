package cn.bootx.goods.param.sku;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
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
@ApiModel("sku添加")
public class SkuParam implements Serializable {
    private static final long serialVersionUID = -8038996282288514501L;

    @ApiModelProperty(value = "主键")
    private Long id;

    @ApiModelProperty(value = "所属类目id")
    private Long cid;

    @ApiModelProperty(value = "外部编码")
    private String outNo;

    @ApiModelProperty(value = "所属商品id")
    private Long goodsId;

    @ApiModelProperty(value = "SKU名称")
    private String name;

    @ApiModelProperty(value = "SKU描述")
    private String description;

    @ApiModelProperty(value = "附加信息")
    private String addition;

    @ApiModelProperty("是否打包品")
    private boolean packing;

    @ApiModelProperty("是否无限库存")
    private boolean unlimited;

    @ApiModelProperty("初始库存")
    private Integer capacity;

    @ApiModelProperty(value = "售价")
    private BigDecimal price;

}
