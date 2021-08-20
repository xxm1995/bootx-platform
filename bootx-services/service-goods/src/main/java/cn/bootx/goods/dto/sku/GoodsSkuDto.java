package cn.bootx.goods.dto.sku;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;

/**
* 商品SKU
* @author xxm
* @date 2020/11/19
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@ApiModel(value = "商品SKU DTO")
public class GoodsSkuDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 9214661437061650242L;

    @ApiModelProperty("主键")
    private Long id;
    @ApiModelProperty(value = "所属类目id")
    private Long cid;
    @ApiModelProperty(value = "所属商品id")
    private Long goodsId;
    @ApiModelProperty(value = "SKU名称", required = true)
    private String name;
    @ApiModelProperty(value = "SKU描述")
    private String description;
    @ApiModelProperty(value = "附加信息")
    private String addition;

    @ApiModelProperty(value = "无限库存")
    private boolean unlimited;
    @ApiModelProperty(value = "库存总量")
    private Integer capacity;
    @ApiModelProperty(value = "预占库存")
    private int locked;
    @ApiModelProperty(value = "已用库存")
    private int sold;
    @ApiModelProperty(value = "可用库存")
    private Integer available;

    @ApiModelProperty(value = "售价")
    private BigDecimal price;
    @ApiModelProperty(value = "状态")
    private int state;
}