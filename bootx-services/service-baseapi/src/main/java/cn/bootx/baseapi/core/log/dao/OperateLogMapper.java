package cn.bootx.baseapi.core.log.dao;

import cn.bootx.baseapi.core.log.entity.OperateLogger;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OperateLogMapper extends BaseMapper<OperateLogger> {
}
