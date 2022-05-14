package cn.bootx.goods.core.goods.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.goods.entity.Goods;
import cn.bootx.goods.param.goods.GoodsParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
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

    /**
     * 分页
     */
    public Page<Goods> page(PageParam param, GoodsParam query){
        Page<Goods> mpPage = MpUtil.getMpPage(param, Goods.class);
        return this.lambdaQuery()
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }
}
