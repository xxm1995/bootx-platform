package cn.bootx.starter.auth.cache;

import cn.bootx.common.core.entity.UserDetail;
import com.alibaba.ttl.TransmittableThreadLocal;

/**
* 会话缓存线程存储
* @author xxm
* @date 2022/1/8
*/
public final class SessionCacheLocal {
    private static final ThreadLocal<UserDetail> THREAD_LOCAL = new TransmittableThreadLocal<>();

    /**
     * TTL 设置数据
     */
    public static void put(UserDetail userDetail) {
       THREAD_LOCAL.set(userDetail);
    }

    /**
     * 获取TTL中的数据
     */
    public static UserDetail get() {
        return THREAD_LOCAL.get();
    }

    /**
     * 清除
     */
    public static void clear() {
        THREAD_LOCAL.remove();
    }
}
