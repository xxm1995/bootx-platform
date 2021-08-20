package cn.bootx.goods.core.inventory.task;

import cn.bootx.common.redis.RedisClient;
import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
* 库存定时任务
* @author xxm
* @date 2021/4/16
*/
@EnableScheduling
@Component
@RequiredArgsConstructor
public class InventoryTask {
    private final InventoryTaskService inventoryTaskService;
    private final RedisClient redisClient;
    // 分布式锁, 保证同一时间只会有一个在执行
    private final String REDIS_LOCK_KEY = "lock:expireInventory";
    /**
     * 过期token任务, 释放库存 一分钟执行一次
     */
    @Scheduled(fixedRate = 1000*60)
    public void expireTokensTask(){
        if (redisClient.setIfAbsent(REDIS_LOCK_KEY,"",20*1000)){
            inventoryTaskService.expireTokens();
        }
    }

}
