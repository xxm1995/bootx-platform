package cn.bootx.office.core.model.convert;

import cn.bootx.office.core.model.entity.FlowModel;
import cn.bootx.office.dto.model.FlowModelDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 流程模型
 * @author xxm
 * @date 2022-08-23
 */
@Mapper
public interface FlowModelConvert {
    FlowModelConvert CONVERT = Mappers.getMapper(FlowModelConvert.class);

    FlowModelDto convert(FlowModel in);

}