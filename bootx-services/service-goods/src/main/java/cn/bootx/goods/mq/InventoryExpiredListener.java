package cn.bootx.goods.mq;

import cn.bootx.common.redis.listener.KeyExpiredListener;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * 库存解锁事件
 * @author xxm
 * @date 2022/5/9
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class InventoryExpiredListener implements KeyExpiredListener {

    @Override
    public String getPrefixKey() {
        return "inventory:lock";
    }

    @Override
    public void onMessage(String key) {
        log.info("过期key: "+key);
    }
}
