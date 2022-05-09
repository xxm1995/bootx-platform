package cn.bootx.goods.core.category.entity;

import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 类目参数组 相当于 jd 的规格与包装
* @author xxm
* @date 2022/5/9
*/
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@Schema(title = "gc_category_parameter_group")
public class CategoryParameterGroup extends MpBaseEntity {

    /** 参数组名称 */
    private String name;

    /** 关联类目id */
    private Long categoryId;

    /** 排序 */
    private Double sortNo;
}
