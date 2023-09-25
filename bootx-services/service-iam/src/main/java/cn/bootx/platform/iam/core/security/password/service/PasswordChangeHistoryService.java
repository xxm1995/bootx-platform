package cn.bootx.platform.iam.core.security.password.service;

import cn.bootx.platform.common.core.util.CollUtil;
import cn.bootx.platform.common.core.util.LocalDateTimeUtil;
import cn.bootx.platform.iam.core.security.password.dao.PasswordChangeHistoryManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordChangeHistory;
import cn.bootx.platform.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.platform.iam.core.user.entity.UserExpandInfo;
import cn.bootx.platform.iam.dto.security.PasswordSecurityConfigDto;
import cn.bootx.platform.iam.dto.security.UserVerifyStateResult;
import cn.bootx.platform.iam.exception.user.UserInfoNotExistsException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
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
    private final UserExpandInfoManager userExpandInfoManager;

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
        PasswordSecurityConfigDto securityConfig = passwordSecurityConfigService.getDefault();
        Integer recentPasswordCount = securityConfig.getRecentPassword();
        List<PasswordChangeHistory> changeHistories = passwordChangeHistoryManager.findAllByUserAndCount(userId, recentPasswordCount);
        return changeHistories.stream()
                .anyMatch(o-> Objects.equals(o.getPassword(), password));
    }

    /**
     * 判断用户密码是否需要强制进行更改
     */
    public boolean isPasswordExpire(Long userId){
        PasswordSecurityConfigDto securityConfig = passwordSecurityConfigService.getDefault();
        List<PasswordChangeHistory> changeHistoryList = passwordChangeHistoryManager.findAllByUserAndCount(userId, 1);
        if (CollUtil.isNotEmpty(changeHistoryList)){
            PasswordChangeHistory passwordChangeHistory = changeHistoryList.get(0);
            LocalDateTime createTime = passwordChangeHistory.getCreateTime();
            // 判断距今的时间是否超过密码过期时间
            long day = LocalDateTimeUtil.between(createTime, LocalDateTime.now(), ChronoUnit.DAYS);
            return day > securityConfig.getUpdateFrequency();
        }
        return false;
    }

    /**
     * 是否进行提醒密码修改倒计时
     */
    public int getPasswordExpire(Long userId){
        PasswordSecurityConfigDto securityConfig = passwordSecurityConfigService.getDefault();
        List<PasswordChangeHistory> changeHistoryList = passwordChangeHistoryManager.findAllByUserAndCount(userId, 1);
        if (CollUtil.isNotEmpty(changeHistoryList)){
            PasswordChangeHistory passwordChangeHistory = changeHistoryList.get(0);
            LocalDateTime createTime = passwordChangeHistory.getCreateTime();
            // 判断距今的时间是否超过密码过期时间
            int day = (int) LocalDateTimeUtil.between(createTime, LocalDateTime.now(), ChronoUnit.DAYS);
            // 是否满足提醒修改密码的时间
            if(day < securityConfig.getExpireRemind()){
                return securityConfig.getUpdateFrequency() - day;
            }
        }
        return 0;
    }

    /**
     * 验证状态
     */
    public UserVerifyStateResult verifyUserPassword(Long userId){

        PasswordSecurityConfigDto securityConfig = passwordSecurityConfigService.getDefault();
        // 判断用户初始化密码是否需要修改
        UserExpandInfo userInfo = userExpandInfoManager.findById(userId)
                .orElseThrow(UserInfoNotExistsException::new);
        if (userInfo.isInitialPassword() && securityConfig.isRequireChangePwd()){
            return UserVerifyStateResult.fail("用户初始密码需要修改");
        }
        // 判断用户密码是否需要强制进行更改
        List<PasswordChangeHistory> changeHistoryList = passwordChangeHistoryManager.findAllByUserAndCount(userId, 1);
        if (CollUtil.isNotEmpty(changeHistoryList)){
            PasswordChangeHistory passwordChangeHistory = changeHistoryList.get(0);
            LocalDateTime createTime = passwordChangeHistory.getCreateTime();
            // 判断距今的时间是否超过密码过期时间
            int keepPwdDay = (int) LocalDateTimeUtil.between(createTime, LocalDateTime.now(), ChronoUnit.DAYS);
            int dealDay = securityConfig.getUpdateFrequency() - keepPwdDay;
            // 判断密码是否已经过期
            if( dealDay <= 0 ){
                return UserVerifyStateResult.fail("密码已过期，需要进行修改后才可以使用");
            }
            // 判断是否满足密码修改的倒计时提醒
            if (keepPwdDay < securityConfig.getExpireRemind()){
                return UserVerifyStateResult.fail("密码已过期，需要进行修改后才可以使用");
            }
        }
        return UserVerifyStateResult.success();
    }
}
