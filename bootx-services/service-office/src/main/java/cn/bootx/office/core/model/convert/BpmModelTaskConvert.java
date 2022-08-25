package cn.bootx.office.core.model.convert;

import cn.bootx.office.core.model.entity.BpmModelTask;
import cn.bootx.office.dto.model.BpmModelTaskDto;
import cn.bootx.office.param.model.BpmModelTaskParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 模型任务节点配置
 * @author xxm
 * @date 2022-08-25
 */
@Mapper
public interface BpmModelTaskConvert {
    BpmModelTaskConvert CONVERT = Mappers.getMapper(BpmModelTaskConvert.class);

    BpmModelTask convert(BpmModelTaskParam in);

    BpmModelTaskDto convert(BpmModelTask in);

}