package cn.bootx.goods.core.category.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.goods.core.category.convert.CategoryParameterGroupConvert;
import cn.bootx.goods.dto.category.CategoryParameterGroupDto;
import cn.bootx.goods.param.category.CategoryParameterGroupParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 类目参数组
* @author xxm
* @date 2022-05-09
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("gc_category_parameter_group")
@Accessors(chain = true)
public class CategoryParameterGroup extends MpBaseEntity implements EntityBaseFunction<CategoryParameterGroupDto>{

    /** 参数组名称 */
    private String name;
    /** 排序 */
    private Double sortNo;
    /** 类目id */
    private Long categoryId;
    /** 描述 */
    private String remark;

    /** 创建对象 */
    public static CategoryParameterGroup init(CategoryParameterGroupParam in) {
            return CategoryParameterGroupConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public CategoryParameterGroupDto toDto() {
        return CategoryParameterGroupConvert.CONVERT.convert(this);
    }
}
