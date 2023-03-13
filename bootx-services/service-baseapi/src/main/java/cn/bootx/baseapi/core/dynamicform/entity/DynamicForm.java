package cn.bootx.baseapi.core.dynamicform.entity;

import cn.bootx.baseapi.core.dynamicform.convert.DynamicFormConvert;
import cn.bootx.baseapi.dto.dynamicform.DynamicFormDto;
import cn.bootx.baseapi.param.dynamicform.DynamicFormParam;
import cn.bootx.common.core.annotation.BigField;
import cn.bootx.common.core.function.EntityBaseFunction;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * 动态表单
 *
 * @author xxm
 * @date 2022-07-28
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Accessors(chain = true)
@TableName(value = "base_dynamic_form", autoResultMap = true)
public class DynamicForm extends MpBaseEntity implements EntityBaseFunction<DynamicFormDto> {

    /** 表单名称 */
    private String name;

    /** 表单键名 */
    private String code;

    /** 表单内容 */
    @BigField
    private String value;

    /** 备注 */
    private String remark;

    /** 创建对象 */
    public static DynamicForm init(DynamicFormParam in) {
        return DynamicFormConvert.CONVERT.convert(in);
    }

    /** 转换成dto */
    @Override
    public DynamicFormDto toDto() {
        return DynamicFormConvert.CONVERT.convert(this);
    }

}
