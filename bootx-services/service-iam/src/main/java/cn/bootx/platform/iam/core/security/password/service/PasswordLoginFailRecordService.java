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

    private final static int maxErrCount = 5;

    /**
     * 登录失败的错误处理
     */
    public String passwordError(Long userId){

        PasswordSecurityConfig passwordSecurityConfig = new PasswordSecurityConfig()
                .set;

        // 更新错误次数
        PasswordLoginFailRecord loginFailRecord = passwordLoginFailRecordManager.findById(userId)
                .orElse(new PasswordLoginFailRecord()
                        .setFailCount(0)
                        .setUserId(userId));
        loginFailRecord.setFailCount(loginFailRecord.getFailCount()+1)
                .setFailTime(LocalDateTime.now());

        int errCount = 5 - loginFailRecord.getFailCount();
        // 判断是否超过最大错误次数, 进行锁定用户
        if (errCount <= 0){
            // 锁定用户
            return "密码错误次数超过最大次数, 账号已锁定, 请15分钟后重试";
        }

        return StrUtil.format("密码不正确, 还有{}次机会", errCount);

    }



    /**
     * 清除登录失败的次数
     */
    @Async("taskExecutor")
    public void clearFailCount(Long userId){

    }
}
