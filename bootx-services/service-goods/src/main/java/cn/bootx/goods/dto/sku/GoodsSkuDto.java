package cn.bootx.goods.dto.sku;

import cn.bootx.common.core.rest.dto.BaseDto;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;;
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
@Schema(title = "商品SKU DTO")
public class GoodsSkuDto extends BaseDto implements Serializable {
    private static final long serialVersionUID = 9214661437061650242L;

    @Schema(description= "主键")
    private Long id;
    @Schema(description= "所属类目id")
    private Long cid;
    @Schema(description= "所属商品id")
    private Long goodsId;
    @Schema(description= "SKU名称", required = true)
    private String name;
    @Schema(description= "SKU描述")
    private String description;
    @Schema(description= "附加信息")
    private String addition;

    @Schema(description= "无限库存")
    private boolean unlimited;
    @Schema(description= "库存总量")
    private Integer capacity;
    @Schema(description= "预占库存")
    private int locked;
    @Schema(description= "已用库存")
    private int sold;
    @Schema(description= "可用库存")
    private Integer available;

    @Schema(description= "售价")
    private BigDecimal price;
    @Schema(description= "状态")
    private int state;
}