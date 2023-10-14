package cn.bootx.platform.iam.core.security.password.service;

import cn.bootx.platform.common.core.util.CollUtil;
import cn.bootx.platform.common.core.util.LocalDateTimeUtil;
import cn.bootx.platform.iam.core.security.password.dao.PasswordChangeHistoryManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordChangeHistory;
import cn.bootx.platform.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.platform.iam.core.user.entity.UserExpandInfo;
import cn.bootx.platform.iam.dto.security.PasswordSecurityConfigDto;
import cn.bootx.platform.iam.dto.security.passwordSecurityCheckResult;
import cn.bootx.platform.iam.exception.user.UserInfoNotExistsException;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

/**
 * 密码安全校验服务
 * @author xxm
 * @since 2023/10/14
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PasswordSecurityCheckService {

    private final PasswordSecurityConfigService configService;
    private final PasswordChangeHistoryManager historyManager;

    private final UserExpandInfoManager userExpandInfoManager;


    /**
     * 登录后检查密码相关的情况
     */
    public passwordSecurityCheckResult checkPasswordSecurity(Long userId){
        passwordSecurityCheckResult result = new passwordSecurityCheckResult();
        PasswordSecurityConfigDto securityConfig = configService.getDefault();
        // 检查是否是默认密码未进行修改
        if (this.isDefaultPassword(userId,securityConfig)){
            return result.setDefaultPwd(true);
        }
        int state = this.verifyPasswordExpire(userId, securityConfig);
        // 检查密码是否已经过期
        if (state == 0){
            return result.setExpirePwd(true);
        }
        // 检查密码是否到了提示过期的时候
        if (state < 0){
            return result.setExpireRemind(true)
                    .setExpireRemindNum(Math.abs(state));
        }
        return result;
    }


    /**
     * 判断用户初始化密码是否需要修改
     */
    public boolean isDefaultPassword(Long userId, PasswordSecurityConfigDto securityConfig){
        UserExpandInfo userInfo = userExpandInfoManager.findById(userId)
                .orElseThrow(UserInfoNotExistsException::new);
        return userInfo.isInitialPassword() && securityConfig.isRequireChangePwd();
    }


    /**
     * 验证密码过期和提醒状态
     * 1. 未过期也不需要提醒
     * 0. 密码已经过期
     * -N. 密码还有几天过期, 需要进行提醒
     */
    public int verifyPasswordExpire(Long userId,PasswordSecurityConfigDto securityConfig){

        // 判断用户密码是否需要强制进行更改
        List<PasswordChangeHistory> changeHistoryList = historyManager.findAllByUserAndCount(userId, 1);
        if (CollUtil.isNotEmpty(changeHistoryList)){
            PasswordChangeHistory passwordChangeHistory = changeHistoryList.get(0);
            LocalDateTime createTime = passwordChangeHistory.getCreateTime();
            // 判断距今的时间是否超过密码过期时间
            int keepPwdDay = (int) LocalDateTimeUtil.between(createTime, LocalDateTime.now(), ChronoUnit.DAYS);
            int dealDay = securityConfig.getUpdateFrequency() - keepPwdDay;
            // 判断密码是否已经过期
            if( dealDay <= 0 ){
               return 1;
            }
            // 判断是否满足密码修改的倒计时提醒
            if (keepPwdDay < securityConfig.getExpireRemind()){
                return -keepPwdDay;
            }
        }
        return 0;
    }

}
