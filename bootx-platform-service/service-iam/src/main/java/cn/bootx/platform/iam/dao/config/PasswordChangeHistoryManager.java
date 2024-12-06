package cn.bootx.platform.iam.dao.config;

import cn.bootx.platform.common.mybatisplus.impl.BaseManager;
import cn.bootx.platform.iam.entity.config.PasswordChangeHistory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
 * 密码修改记录
 * @author xxm  
 * @since 2024/12/6 
 */
@Slf4j
@Repository
@RequiredArgsConstructor
public class PasswordChangeHistoryManager extends BaseManager<PasswordChangeHistoryMapper, PasswordChangeHistory> {
}
