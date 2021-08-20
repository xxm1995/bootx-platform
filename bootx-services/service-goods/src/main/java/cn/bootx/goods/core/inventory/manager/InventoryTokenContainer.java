package cn.bootx.goods.core.inventory.manager;

import cn.bootx.goods.exception.inventory.InventoryLockInsufficientException;
import cn.hutool.core.util.RandomUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**   
* 库存操作 Token 容器
* @author xxm  
* @date 2020/11/23 
*/
@Slf4j
@Component
@RequiredArgsConstructor
public class InventoryTokenContainer{

    private final InventoryTokenManager manager;

    /**
     * 获取锁定库存操作 token
     */
    public String saveAndGetToken(Long skuId,int count) {
        String token = RandomUtil.randomString(6);
        // 锁定并存储过期时间
        manager.storeByToken(skuId, token, count);
        return token;
    }

    /**
     * 消耗指定 token 锁定的库存
     */
    public void consumeInventory(Long skuId, int count, String token) {
        int inventory = manager.retrieveByToken(skuId, token);
        // 库存锁定不足异常
        if (inventory < count) {
            throw new InventoryLockInsufficientException();
        }
        int remain = inventory - count;
        if (remain > 0) {
            // 重新设置库存锁定数
            manager.resetByToken(skuId, token, remain);
        } else {
            // 删除库存锁定和过期时间key值
            manager.removeByToken(skuId, token);
            manager.removeExpiredTimeTokenKey(skuId,token);
        }
    }
}
