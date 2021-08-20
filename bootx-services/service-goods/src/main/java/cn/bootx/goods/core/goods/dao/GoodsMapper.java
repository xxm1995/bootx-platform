package cn.bootx.goods.core.goods.dao;

import cn.bootx.goods.core.goods.entity.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

/**
* 商品
* @author xxm
* @date 2021/8/10
*/
@Mapper
public interface GoodsMapper extends BaseMapper<Goods> {
    Optional<Goods> findByIdAndTid(Long id, Long tid);

    List<Goods> findAllByTid(Long tid);

    List<Goods> findAllByCidAndTid(Long cid, Long tid);

    List<Goods> findAllByIdInAndTid(Collection<Long> goodsIds, Long tid);
}
