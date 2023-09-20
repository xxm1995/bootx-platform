package cn.bootx.platform.iam.core.security.password.service;

import cn.bootx.platform.iam.core.security.password.dao.PasswordLoginFailRecordManager;
import cn.bootx.platform.iam.core.security.password.entity.PasswordLoginFailRecord;
import cn.bootx.platform.iam.core.security.password.entity.PasswordSecurityConfig;
import cn.hutool.core.util.StrUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 密码登录失败记录
 * @author xxm
 * @since 2023/9/19
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class PasswordLoginFailRecordService {
    private final PasswordLoginFailRecordManager passwordLoginFailRecordManager;

    /**
     * 登录失败的错误处理
     */
    public String passwordError(Long userId){
        // 密码安全配置
        PasswordSecurityConfig passwordSecurityConfig = new PasswordSecurityConfig()
                .setMaxPwdErrorCount(5)
                .setErrorLockTime(10*60);

        // 更新错误次数
        PasswordLoginFailRecord loginFailRecord = passwordLoginFailRecordManager.findById(userId)
                .orElse(new PasswordLoginFailRecord()
                        .setFailCount(0)
                        .setUserId(userId));
        loginFailRecord.setFailCount(loginFailRecord.getFailCount()+1)
                .setFailTime(LocalDateTime.now());
        passwordLoginFailRecordManager.saveOrUpdate(loginFailRecord);

        // 判断是否超过最大错误次数, 进行锁定用户
        int errCount = passwordSecurityConfig.getMaxPwdErrorCount() - loginFailRecord.getFailCount();
        if (errCount <= 0){
            // 锁定用户
            return StrUtil.format("密码错误次数超过{}次, 请{}分钟后再试",
                    loginFailRecord.getFailCount()-1,passwordSecurityConfig.getMaxPwdErrorCount());
        }
        return StrUtil.format("密码不正确, 还有{}次机会", errCount);
    }

    /**
     * 清除登录失败的次数
     */
    @Async("taskExecutor")
    public void clearFailCount(Long userId){
        passwordLoginFailRecordManager.findById(userId)
                .ifPresent(r -> {
                    if (r.getFailCount() > 0){
                        r.setFailCount(0);
                        passwordLoginFailRecordManager.updateById(r);
                    }
                });
    }

    /**
     * 批量清除登录失败的次数
     */
    @Async("taskExecutor")
    public void clearBatchFailCount(List<Long> userIds){
        passwordLoginFailRecordManager.clearBatchFailCount(userIds);
    }
}
