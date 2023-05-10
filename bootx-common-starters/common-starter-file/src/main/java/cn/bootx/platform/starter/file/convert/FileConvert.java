package cn.bootx.platform.starter.file.convert;

import cn.bootx.platform.starter.file.dto.UpdateFileDto;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author xxm
 * @date 2022/1/12
 */
@Mapper
public interface FileConvert {

    FileConvert CONVERT = Mappers.getMapper(FileConvert.class);

    UpdateFileDto convert(UpdateFileInfo in);

}
