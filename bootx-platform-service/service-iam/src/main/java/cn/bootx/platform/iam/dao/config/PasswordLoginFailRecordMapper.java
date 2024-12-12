package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.iam.entity.security.PasswordLoginFailRecord;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 密码登录失败记录
 * @author xxm
 * @since 2024/12/6
 */
@Mapper
public interface PasswordLoginFailRecordMapper extends MPJBaseMapper<PasswordLoginFailRecord> {
}
