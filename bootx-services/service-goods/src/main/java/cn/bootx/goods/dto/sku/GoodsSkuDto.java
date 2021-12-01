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

    @Schema(name = "主键")
    private Long id;
    @Schema(name = "所属类目id")
    private Long cid;
    @Schema(name = "所属商品id")
    private Long goodsId;
    @Schema(name = "SKU名称", required = true)
    private String name;
    @Schema(name = "SKU描述")
    private String description;
    @Schema(name = "附加信息")
    private String addition;

    @Schema(name = "无限库存")
    private boolean unlimited;
    @Schema(name = "库存总量")
    private Integer capacity;
    @Schema(name = "预占库存")
    private int locked;
    @Schema(name = "已用库存")
    private int sold;
    @Schema(name = "可用库存")
    private Integer available;

    @Schema(name = "售价")
    private BigDecimal price;
    @Schema(name = "状态")
    private int state;
}