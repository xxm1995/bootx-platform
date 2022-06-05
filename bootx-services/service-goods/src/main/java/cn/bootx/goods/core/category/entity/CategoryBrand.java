package cn.bootx.goods.core.category.entity;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 类目品牌关联
* @author xxm
* @date 2022/5/9
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("goods_category_brand")
public class CategoryBrand extends MpIdEntity {

    /** 分类id */
    private Long categoryId;

    /** 品牌id */
    private Long brandId;

}
