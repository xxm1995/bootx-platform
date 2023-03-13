package cn.bootx.baseapi.core.dynamicform.convert;

import cn.bootx.baseapi.core.dynamicform.entity.DynamicForm;
import cn.bootx.baseapi.dto.dynamicform.DynamicFormDto;
import cn.bootx.baseapi.param.dynamicform.DynamicFormParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 动态表单
 *
 * @author xxm
 * @date 2022-07-28
 */
@Mapper
public interface DynamicFormConvert {

    DynamicFormConvert CONVERT = Mappers.getMapper(DynamicFormConvert.class);

    DynamicForm convert(DynamicFormParam in);

    DynamicFormDto convert(DynamicForm in);

}