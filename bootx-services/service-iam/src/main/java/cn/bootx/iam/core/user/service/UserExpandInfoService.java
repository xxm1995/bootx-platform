package cn.bootx.iam.core.user.service;

import cn.bootx.common.core.exception.BizException;
import cn.bootx.iam.core.user.dao.UserExpandInfoManager;
import cn.bootx.iam.core.user.entity.UserExpandInfo;
import cn.hutool.core.thread.ThreadUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

/**
 * 用户扩展信息服务
 *
 * @author xxm
 * @date 2022/1/8
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
