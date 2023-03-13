package cn.bootx.starter.flowable.core.model.convert;

import cn.bootx.starter.flowable.core.model.entity.BpmModelNode;
import cn.bootx.starter.flowable.dto.model.BpmModelNodeDto;
import cn.bootx.starter.flowable.param.model.BpmModelNodeParam;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 模型任务节点配置
 *
 * @author xxm
 * @date 2022-08-25
 */
@Mapper
public interface BpmModelNodeConvert {

    BpmModelNodeConvert CONVERT = Mappers.getMapper(BpmModelNodeConvert.class);

    BpmModelNode convert(BpmModelNodeParam in);

    BpmModelNodeDto convert(BpmModelNode in);

}