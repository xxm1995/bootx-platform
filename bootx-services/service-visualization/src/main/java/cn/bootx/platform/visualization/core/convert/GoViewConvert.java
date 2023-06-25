package cn.bootx.platform.visualization.core.convert;

import cn.bootx.platform.visualization.core.entity.ProjectInfo;
import cn.bootx.platform.visualization.dto.ProjectInfoDto;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

/**
 * 转换
 *
 * @author xxm
 * @since 2023/3/2
 */
@Mapper
public interface GoViewConvert {

    GoViewConvert CONVERT = Mappers.getMapper(GoViewConvert.class);

    ProjectInfoDto convert(ProjectInfo in);

}
