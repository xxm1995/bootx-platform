package cn.bootx.starter.flowable.core.model.convert;

import cn.bootx.starter.flowable.core.model.entity.BpmModel;
import cn.bootx.starter.flowable.dto.model.BpmModelDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 流程模型
 *
 * @author xxm
 * @date 2022-08-23
 */
@Mapper
public interface BpmModelConvert {

    BpmModelConvert CONVERT = Mappers.getMapper(BpmModelConvert.class);

    BpmModelDto convert(BpmModel in);

}