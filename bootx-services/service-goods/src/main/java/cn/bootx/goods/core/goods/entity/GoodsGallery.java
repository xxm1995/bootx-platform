package cn.bootx.goods.core.goods.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 商品相册
* @author xxm
* @date 2022/5/9
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("gc_goods_gallery")
public class GoodsGallery extends MpBaseEntity {

    /** 商品id */
    private Long goodsId;

    /** 缩略图 */
    private String thumbnail;

    /** 小图 */
    private String small;

    /** 原图 */
    private String original;

    /** 是否主图 */
    private Boolean main;

    /** 排序 */
    private Double sortNo;
}
