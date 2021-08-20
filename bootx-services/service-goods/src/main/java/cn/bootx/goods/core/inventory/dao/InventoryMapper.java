package cn.bootx.goods.core.inventory.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

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
    @Update(" update gc_goods_sku " +
            " set available = (available - #{count}), locked = (locked + #{count}), version = (version + 1) " +
            " where id = #{id} and (available - #{count}) >= 0")
    int lockInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 解锁库存
     */
    @Update(" update gc_goods_sku " +
            " set available = (available + #{count}), locked = (locked - #{count}), version = (version + 1) " +
            " where id = #{id} and (locked - #{count}) >= 0")
    int unlockInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 减少库存
     */
    @Update(" update gc_goods_sku " +
            " set locked = (locked - #{count}), sold = (sold + #{count}), version = (version + 1) " +
            " where id = #{id} and (locked - #{count}) >= 0")
    int reduceInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 增补指定 SKU 的可售库存， 扣减对应售出
     */
    @Update(" update gc_goods_sku " +
            " set available = (available + #{count}), sold = (sold - #{count}), version = (version + 1) " +
            " where id = #{id}")
    int increaseInventory(@Param("id") Long id, @Param("count") int count);

    /**
     * 增补指定 SKU 的可售库存
     */
    @Update(" update gc_goods_sku " +
            " set available = (available + #{count}), capacity = (capacity + #{count}), version = (version + 1) " +
            " where id = #{id}")
    int increaseAvailable(@Param("id") Long id, @Param("count") int count);

    /**
     * 扣减指定 SKU 的预占库存并减少总库存
     */
    @Update(" update gc_goods_sku " +
            " set locked = (locked - #{count}), capacity = (capacity - #{count}), version = (version + 1) " +
            " where id = #{id} and (locked - #{count}) >= 0")
    int reduceLockedAndCapacity(@Param("id") Long id, @Param("count") int count);

    /**
     * 扣减指定 SKU 的售出库存并减少总库存
     */
    @Update(" update gc_goods_sku " +
            " set sold = (sold - #{count}), capacity = (capacity - #{count}), version = (version + 1) " +
            " where id = #{id} and (capacity - #{count}) >= 0 and (sold - #{count}) >= 0")
    int reduceSoldAndCapacity(@Param("id") Long id, @Param("count") int count);
}
