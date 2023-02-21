package cn.bootx.visualization.dao;

import cn.bootx.visualization.dto.ProjectInfoDto;
import cn.bootx.visualization.entity.ProjectInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 *
 * @author xxm
 * @date 2023/2/21
 */
@Mapper
public interface ProjectInfoMapper extends BaseMapper<ProjectInfo> {
}
