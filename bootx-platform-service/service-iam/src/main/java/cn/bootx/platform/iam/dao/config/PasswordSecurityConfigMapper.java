package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.iam.entity.config.PasswordSecurityConfig;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
 * 密码安全配置
 * @author xxm  
 * @since 2024/12/6 
 */
@Mapper
public interface PasswordSecurityConfigMapper extends MPJBaseMapper<PasswordSecurityConfig> {
}
