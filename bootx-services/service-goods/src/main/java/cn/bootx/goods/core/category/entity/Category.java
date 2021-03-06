package cn.bootx.goods.core.category.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.goods.core.category.convert.CategoryConvert;
import cn.bootx.goods.dto.category.CategoryDto;
import cn.bootx.goods.param.category.CategoryParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;


/**
* 类目
* @author xxm
* @date 2020/11/19
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("goods_category")
@Accessors(chain = true)
public class Category extends MpBaseEntity implements EntityBaseFunction<CategoryDto> {
    private static final long serialVersionUID = -3604408346443111551L;

    /** 上级类目id */
    private Long pid;
    /** 类目名称 */
    private String name;
    /** 描述 */
    private String remark;
    /** 状态 */
    private Boolean enable;
    /** 排序 */
    private Double sortNo;
    /** 图标/图片地址 */
    private String image;
    /** 层级 */
    private Integer level;

    public static Category init(CategoryParam in) {
        return CategoryConvert.CONVERT.convert(in);
    }

    @Override
    public CategoryDto toDto() {
        return CategoryConvert.CONVERT.convert(this);
    }

}
