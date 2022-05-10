package cn.bootx.goods.core.category.entity;

import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import cn.bootx.goods.dto.spec.SpecificationDto;
import cn.bootx.goods.param.category.SpecificationParam;
import cn.bootx.goods.core.category.convert.SpecificationConvert;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
* 规格
* @author xxm
* @date 2022-05-09
*/
@EqualsAndHashCode(callSuper = true)
@Data
@TableName("gc_category_spec")
@Accessors(chain = true)
public class Specification extends MpBaseEntity implements EntityBaseFunction<SpecificationDto>{

    /** 规格名称 */
    private String name;

    /** 规格类型(文本/列表选择) */
    private String type;

    /** 规格值(列表) */
    private String values;

    /** 状态 */
    private String state;

    /** 描述 */
    private String remark;

    /** 创建对象 */
    public static Specification init(SpecificationParam in) {
            return SpecificationConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public SpecificationDto toDto() {
        return SpecificationConvert.CONVERT.convert(this);
    }
}
