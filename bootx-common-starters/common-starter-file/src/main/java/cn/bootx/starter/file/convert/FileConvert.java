package cn.bootx.starter.file.convert;

import cn.bootx.starter.file.dto.UpdateFileDto;
import cn.bootx.starter.file.entity.UpdateFileInfo;
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
