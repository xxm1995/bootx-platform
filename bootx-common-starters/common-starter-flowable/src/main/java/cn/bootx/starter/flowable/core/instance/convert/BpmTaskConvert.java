package cn.bootx.starter.flowable.core.instance.convert;

import cn.bootx.starter.flowable.core.instance.entity.BpmTask;
import cn.bootx.starter.flowable.dto.task.BpmTaskDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 流程任务扩展
 * @author xxm
 * @date 2022-09-01
 */
@Mapper
public interface BpmTaskConvert {
    BpmTaskConvert CONVERT = Mappers.getMapper(BpmTaskConvert.class);

    BpmTaskDto convert(BpmTask in);

}