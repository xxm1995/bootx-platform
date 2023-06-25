package cn.bootx.platform.demo.core.mq.redis;

import cn.bootx.platform.common.redis.listener.RedisKeyExpiredListener;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * redis过期事件监听
 *
 * @author xxm
 * @since 2022/5/30
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DemoRedisExpiredListener implements RedisKeyExpiredListener {

    @Override
    public String getPrefixKey() {
        return "demo:redis:expired:";
    }

    @Override
    public void onMessage(String key) {
        log.info("redis过期事件监听演示, key : {}", key);
    }

}
