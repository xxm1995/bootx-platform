package cn.bootx.goods.core.goods.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.core.goods.entity.Goods;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
* 商品
* @author xxm
* @date 2020/11/20
*/
@Repository
@RequiredArgsConstructor
public class GoodsManager extends BaseManager<GoodsMapper,Goods> {

    public List<Goods> findByCid(Long cid) {
        return findAllByField(Goods::getCid,cid);
    }
}
