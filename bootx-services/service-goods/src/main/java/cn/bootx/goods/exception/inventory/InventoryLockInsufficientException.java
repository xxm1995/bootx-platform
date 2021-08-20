package cn.bootx.goods.exception.inventory;

import cn.bootx.common.core.exception.BizException;

import static cn.bootx.goods.code.GoodsErrorCode.INVENTORY_LOCK_INSUFFICIENT;


/**
* 预占的库存不足异常
* @author xxm  
* @date 2020/11/23 
*/
public class InventoryLockInsufficientException extends BizException {
    public InventoryLockInsufficientException() {
        super(INVENTORY_LOCK_INSUFFICIENT, "预占的库存不足异常");
    }
}
