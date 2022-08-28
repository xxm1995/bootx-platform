package cn.bootx.starter.flowable.local;

import com.alibaba.ttl.TransmittableThreadLocal;

import java.util.Optional;

/**   
 * 流程任务处理缓存类
 * @author xxm  
 * @date 2022/8/28 
 */
public class BpmContextLocal {
    private static final ThreadLocal<BpmContext> THREAD_LOCAL_TENANT = new TransmittableThreadLocal<>();


    /**
     * TTL 设置数据
     */
    public static void put(BpmContext bpmContext) {
        THREAD_LOCAL_TENANT.set(bpmContext);
    }

    /**
     * 获取TTL中的数据
     */
    public static BpmContext get() {
        return Optional.ofNullable(THREAD_LOCAL_TENANT.get()).orElse(new BpmContext());
    }

    /**
     * 清除
     */
    public static void clear() {
        THREAD_LOCAL_TENANT.remove();
    }
}
