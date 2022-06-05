package cn.bootx.goods.core.category.entity;

import cn.bootx.common.mybatisplus.base.MpIdEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 商品分类规格
 * @author xxm
 * @date 2022/5/9
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName("goods_category_specification")
public class CategorySpecification extends MpIdEntity {

    /** 类目id */
    private Long categoryId;

    /** 规格id */
    private Long specificationId;
}
