package cn.bootx.starter.auth.cache;

import cn.bootx.common.core.entity.UserDetail;
import com.alibaba.ttl.TransmittableThreadLocal;

import java.util.Optional;

/**
* 会话缓存线程存储
* @author xxm
* @date 2022/1/8
*/
public final class SessionCacheLocal {
    private static final ThreadLocal<Optional<UserDetail>> THREAD_LOCAL_TENANT = new TransmittableThreadLocal<>();

    /**
     * TTL 设置数据
     */
    @SuppressWarnings("OptionalUsedAsFieldOrParameterType")
    public static void put(Optional<UserDetail> userDetail) {
       THREAD_LOCAL_TENANT.set(userDetail);
    }

    /**
     * 获取TTL中的数据
     */
    public static Optional<UserDetail> get() {
        return THREAD_LOCAL_TENANT.get();
    }

    /**
     * 清除
     */
    public static void clear() {
        THREAD_LOCAL_TENANT.remove();
    }
}
