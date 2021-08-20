package cn.bootx.goods.core.sku.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.goods.core.sku.convert.SkuConvert;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import cn.bootx.goods.param.sku.SkuParam;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * 商品 SKU
 * @author xxm
 * @date 2020/11/19
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("gc_goods_sku")
public class GoodsSku extends MpBaseEntity implements EntityBaseFunction<GoodsSkuDto> {

    /**  所属类目id */
    private Long cid;
    /** 商品 id */
    private Long goodsId;
    /** 外部编码 */
    private String outNo;
    /** SKU 名称 */
    private String name;
    /** 描述 */
    private String description;
    /** 附加信息 */
    private String addition;

    /** 是否无限库存 */
    @TableField("is_unlimited")
    private boolean unlimited;

    /** 初始库存 */
    private Integer capacity;
    /** 预占库存 */
    private int locked;
    /** 已用库存 */
    private int sold;
    /** 可用库存 */
    private Integer available;

    /** 价格 */
    private BigDecimal price;

    /** 状态 */
    private int state;

    public static GoodsSku init(GoodsSkuDto in) {
        return SkuConvert.CONVERT.convert(in);
    }

    public static GoodsSku init(SkuParam in) {
        return SkuConvert.CONVERT.convert(in);
    }

    @Override
    public GoodsSkuDto toDto() {
        return SkuConvert.CONVERT.convert(this);
    }

}
