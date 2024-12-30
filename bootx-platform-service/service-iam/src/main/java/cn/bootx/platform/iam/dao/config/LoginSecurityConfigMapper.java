package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.iam.entity.security.LoginSecurityConfig;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 登录安全策略
 * @author xxm
 * @since 2024/12/12
 */
@Mapper
public interface LoginSecurityConfigMapper extends MPJBaseMapper<LoginSecurityConfig> {
}
