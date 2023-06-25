package cn.bootx.platform.iam.core.user.service;

import cn.bootx.platform.common.core.exception.BizException;
import cn.bootx.platform.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.platform.iam.core.user.entity.UserExpandInfo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * 用户扩展信息服务
 *
 * @author xxm
 * @since 2022/1/8
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class UserExpandInfoService {

    private final UserExpandInfoManager userExpandInfoManager;

    /**
     * 更新登录时间
     */
    @Async("asyncExecutor")
    public void updateLoginTime(Long userId) {
        UserExpandInfo userExpandInfo = userExpandInfoManager.findById(userId).orElseThrow(BizException::new);
        userExpandInfo.setLastLoginTime(userExpandInfo.getCurrentLoginTime()).setCurrentLoginTime(LocalDateTime.now());
        userExpandInfoManager.updateById(userExpandInfo);
    }

}
