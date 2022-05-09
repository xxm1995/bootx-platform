package cn.bootx.common.lock.service.impl;

import cn.bootx.common.lock.entity.LockInfo;
import cn.bootx.common.lock.service.LockService;
import lombok.RequiredArgsConstructor;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**
 * 公平锁实现
 *
 * @author xianzhi.chen@hand-china.com 2019年1月14日下午4:28:07
 */
@Scope(SCOPE_PROTOTYPE)
@Service
@RequiredArgsConstructor
public class FairLockServiceImpl implements LockService {

    private final RedissonClient redissonClient;
    private final ThreadLocal<LockInfo> lockInfoThreadLocal = new ThreadLocal<>();

    @Override
    public void setLockInfo(LockInfo lockInfo) {
        lockInfoThreadLocal.set(lockInfo);
    }

    @Override
    public LockInfo getLockInfo() {
        return lockInfoThreadLocal.get();
    }

    @Override
    public void clearLockInfo() {
        lockInfoThreadLocal.remove();
    }

    @Override
    public boolean lock() {
        LockInfo lockInfo = lockInfoThreadLocal.get();
        RLock rLock = redissonClient.getFairLock(lockInfo.getName());
        try {
            return rLock.tryLock(lockInfo.getWaitTime(), lockInfo.getLeaseTime(), lockInfo.getTimeUnit());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void releaseLock() {
        LockInfo lockInfo = lockInfoThreadLocal.get();
        RLock rLock = redissonClient.getFairLock(lockInfo.getName());
        if (rLock.isHeldByCurrentThread()) {
            rLock.unlockAsync();
        }
        lockInfoThreadLocal.remove();
    }
}
