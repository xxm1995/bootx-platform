package cn.bootx.platform.iam.core.security.password.dao;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordChangeHistory;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 密码历史
 * @author xxm
 * @since 2023-09-19
 */
@Repository
@RequiredArgsConstructor
public class PasswordChangeHistoryManager extends BaseManager<PasswordChangeHistoryMapper, PasswordChangeHistory> {

}
