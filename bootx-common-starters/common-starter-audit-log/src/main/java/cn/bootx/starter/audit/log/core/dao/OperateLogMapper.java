package cn.bootx.starter.audit.log.core.dao;

import cn.bootx.starter.audit.log.core.entity.OperateLogger;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface OperateLogMapper extends BaseMapper<OperateLogger> {
}
