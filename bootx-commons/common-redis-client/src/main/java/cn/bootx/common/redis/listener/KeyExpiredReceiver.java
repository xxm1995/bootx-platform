package cn.bootx.common.redis.listener;

import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * key过期事件接收
 * @author xxm
 * @date 2022/5/7
 */
@Slf4j
@Component
public class KeyExpiredReceiver extends KeyExpirationEventMessageListener {
    private final List<KeyExpiredListener> keyExpiredListeners;

    public KeyExpiredReceiver(RedisMessageListenerContainer listenerContainer, List<KeyExpiredListener> keyExpiredListeners) {
        super(listenerContainer);
        this.keyExpiredListeners = keyExpiredListeners;
    }

    @Override
    public void onMessage(Message message, byte[] pattern) {
        String expiredKey = new String(message.getBody());
        for (KeyExpiredListener keyExpiredListener : keyExpiredListeners) {
            String prefixKey = keyExpiredListener.getPrefixKey();
            if (StrUtil.startWith(expiredKey,prefixKey)){
                // 去除key前缀
                keyExpiredListener.onMessage(StrUtil.removePrefix(expiredKey,prefixKey));
            }
        }
    }
}
