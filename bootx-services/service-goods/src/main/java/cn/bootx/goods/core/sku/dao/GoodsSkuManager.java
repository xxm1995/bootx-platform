package cn.bootx.goods.core.sku.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.core.sku.entity.GoodsSku;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**   
*  商品sku
* @author xxm  
* @date 2020/11/20 
*/
@Repository
@RequiredArgsConstructor
public class GoodsSkuManager extends BaseManager<GoodsSkuMapper,GoodsSku> {


    public List<GoodsSku> findByGoodsId(Long goodsId) {
        return findAllByField(GoodsSku::getGoodsId,goodsId);
    }

}
