package cn.bootx.goods.core.inventory.handler;

/**   
* 被打包商品库存处理器
* @author xxm  
* @date 2021/2/7 
*/
@FunctionalInterface
public interface PackedInventoryHandler {

    /**
     * 处理函数
     */
    void handle(Long skuId, int count);
}
