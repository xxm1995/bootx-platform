package cn.bootx.starter.flowable.core.instance.convert;

import cn.bootx.starter.flowable.core.instance.entity.BpmInstance;
import cn.bootx.starter.flowable.dto.instance.BpmInstanceDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 流程实例扩展
 * @author xxm
 * @date 2022-08-23
 */
@Mapper
public interface BpmInstanceConvert {
    BpmInstanceConvert CONVERT = Mappers.getMapper(BpmInstanceConvert.class);

    BpmInstanceDto convert(BpmInstance in);

}