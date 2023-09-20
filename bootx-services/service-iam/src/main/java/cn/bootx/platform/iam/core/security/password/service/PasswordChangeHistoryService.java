package cn.bootx.platform.iam.core.security.password.service;

import cn.bootx.platform.iam.core.security.password.dao.PasswordChangeHistoryManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordChangeHistory;
import cn.bootx.platform.iam.dto.security.PasswordSecurityConfigDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
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
    private final PasswordSecurityConfigService passwordSecurityConfigService;

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
        PasswordSecurityConfigDto securityConfig = passwordSecurityConfigService.findByDefault();
        Integer recentPassword = securityConfig.getRecentPassword();
        List<PasswordChangeHistory> changeHistories = passwordChangeHistoryManager.findCountAllByUser(userId, recentPassword);
        return changeHistories.stream()
                .anyMatch(o-> Objects.equals(o.getPassword(), password));
    }
}
