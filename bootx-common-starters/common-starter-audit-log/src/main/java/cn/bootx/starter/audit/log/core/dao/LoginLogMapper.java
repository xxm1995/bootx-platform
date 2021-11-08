package cn.bootx.starter.audit.log.core.dao;

import cn.bootx.starter.audit.log.core.entity.LoginLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
* 登录日志
* @author xxm
* @date 2021/8/12
*/
@Mapper
public interface LoginLogMapper extends BaseMapper<LoginLog> {
}
