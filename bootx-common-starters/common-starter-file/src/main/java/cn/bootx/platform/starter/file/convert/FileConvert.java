package cn.bootx.platform.starter.file.convert;

import cn.bootx.platform.starter.file.dto.UpdateFileDto;
import cn.bootx.platform.starter.file.entity.UpdateFileInfo;
import org.dromara.x.file.storage.core.FileInfo;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * @author xxm
 * @since 2022/1/12
 */
@Mapper
public interface FileConvert {

    FileConvert CONVERT = Mappers.getMapper(FileConvert.class);

    UpdateFileDto convert(UpdateFileInfo in);

    UpdateFileInfo convert(FileInfo in);

    FileInfo toFileInfo(UpdateFileInfo in);

    UpdateFileDto toDto(FileInfo in);


}
