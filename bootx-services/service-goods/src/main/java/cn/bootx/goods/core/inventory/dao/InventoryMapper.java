package cn.bootx.goods.core.inventory.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
* 库存操作 数据库
* @author xxm
* @date 2020/11/23
*/
@Mapper
public interface InventoryMapper {

    /**
     * 锁定库存
     */
    int lockInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 解锁库存
     */
    int unlockInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 减少库存
     */
    int reduceInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 增补指定 SKU 的可售库存， 扣减对应售出
     */
    int increaseInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 增补指定 SKU 的可售库存
     */
    int increaseAvailable(@Param("id") Long id, @Param("count") int count);

    /**
     * 扣减指定 SKU 的预占库存并减少总库存
     */
    int reduceLockedAndCapacity(@Param("id") Long id, @Param("count") int count);

    /**
     * 扣减指定 SKU 的售出库存并减少总库存
     */
    int reduceSoldAndCapacity(@Param("id") Long id, @Param("count") int count);
}
