package cn.bootx.iam.core.client.dao;

import cn.bootx.iam.core.client.entity.Application;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 认证应用
 * @author xxm
 * @date 2022-06-27
 */
@Mapper
public interface ApplicationMapper extends BaseMapper<Application> {
}