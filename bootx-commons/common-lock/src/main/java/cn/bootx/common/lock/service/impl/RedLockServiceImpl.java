package cn.bootx.common.lock.service.impl;

import cn.bootx.common.lock.entity.LockInfo;
import cn.bootx.common.lock.service.LockService;
import lombok.RequiredArgsConstructor;
import org.redisson.RedissonRedLock;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import static org.springframework.beans.factory.config.BeanDefinition.SCOPE_PROTOTYPE;

/**
 * 红锁实现类
 *
 * @author xianzhi.chen@hand-china.com 2019年3月15日下午3:33:16
 */
@Scope(SCOPE_PROTOTYPE)
@Service
@RequiredArgsConstructor
public class RedLockServiceImpl implements LockService {

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
        RLock[] lockList = new RLock[lockInfo.getKeyList().size()];
        for (int i = 0; i < lockInfo.getKeyList().size(); i++) {
            lockList[i] = redissonClient.getLock(lockInfo.getKeyList().get(i));
        }
        try {
            RedissonRedLock lock = new RedissonRedLock(lockList);
            return lock.tryLock(lockInfo.getWaitTime(), lockInfo.getLeaseTime(), lockInfo.getTimeUnit());
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void releaseLock() {
        LockInfo lockInfo = lockInfoThreadLocal.get();
        RLock[] lockList = new RLock[lockInfo.getKeyList().size()];
        for (int i = 0; i < lockInfo.getKeyList().size(); i++) {
            lockList[i] = redissonClient.getLock(lockInfo.getKeyList().get(i));
        }
        RedissonRedLock lock = new RedissonRedLock(lockList);
        lock.unlock();
        lockInfoThreadLocal.remove();
    }
}
