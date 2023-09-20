package cn.bootx.platform.iam.core.security.password.service;

import cn.bootx.platform.iam.core.security.password.dao.PasswordChangeHistoryManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordChangeHistory;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * 密码更改历史
 * @author xxm
 * @since 2023-09-19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PasswordChangeHistoryService {
    private final PasswordChangeHistoryManager passwordChangeHistoryManager;

    /**
     * 保存密码更改历史
     */
    @Async("asyncExecutor")
    public void saveChangeHistory(Long userId,String password){
        PasswordChangeHistory passwordChangeHistory = new PasswordChangeHistory()
                .setUserId(userId)
                .setPassword(password);
        passwordChangeHistoryManager.save(passwordChangeHistory);
    }

    /**
     * 批量保存密码更改历史
     */
    @Async("asyncExecutor")
    public void saveBatchChangeHistory(List<Long> userIds, String password){
        List<PasswordChangeHistory> changeHistories = userIds.stream()
                .map(userId -> new PasswordChangeHistory()
                        .setPassword(password)
                        .setUserId(userId))
                .collect(Collectors.toList());

        passwordChangeHistoryManager.saveAll(changeHistories);
    }

    /**
     * 查看要修改的密码是否重复
     */
    public boolean isRecentlyUsed(Long userId,String password){
        // TODO 需要读取最近5条密码记录，判断是否重复, 后期更换为系统配置

        return false;
    }
}
