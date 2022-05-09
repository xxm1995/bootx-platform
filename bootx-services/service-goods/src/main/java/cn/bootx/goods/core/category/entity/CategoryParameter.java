package cn.bootx.goods.core.category.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.goods.core.category.convert.CategoryParameterConvert;
import cn.bootx.goods.dto.category.CategoryParameterDto;
import cn.bootx.goods.param.category.CategoryParameterParam;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 类目参数
* @author xxm
* @date 2022-05-09
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("gc_category_parameter")
@Accessors(chain = true)
public class CategoryParameter extends MpBaseEntity implements EntityBaseFunction<CategoryParameterDto>{

    /** 品牌名称 */
    private String name;
    /** 选择值(列表) */
    private String options;
    /** 是否必填 */
    private Boolean required;
    /** 排序 */
    private Double sortNo;
    /** 参数组id */
    private Long groupId;
    /** 类目id */
    private Long categoryId;
    /** 描述 */
    private String remark;

    /** 创建对象 */
    public static CategoryParameter init(CategoryParameterParam in) {
            return CategoryParameterConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public CategoryParameterDto toDto() {
        return CategoryParameterConvert.CONVERT.convert(this);
    }
}
