package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.iam.entity.security.PasswordChangeHistory;
import com.github.yulichang.base.MPJBaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 密码修改记录
 * @author xxm
 * @since 2024/12/6
 */
@Mapper
public interface PasswordChangeHistoryMapper extends MPJBaseMapper<PasswordChangeHistory> {
}
