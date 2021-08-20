package cn.bootx.goods.core.sku.service;

import cn.bootx.common.core.util.ResultConvertUtils;
import cn.bootx.goods.core.sku.dao.GoodsSkuManager;
import cn.bootx.goods.core.sku.entity.GoodsSku;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import cn.bootx.goods.exception.sku.SkuNotFoundException;
import cn.bootx.goods.param.sku.SkuParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * sku管理
 * @author xxm
 * @date 2020/11/20
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class GoodsSkuService {
    private final GoodsSkuManager skuManager;


    /**
     * 添加sku
     */
    public GoodsSkuDto add(SkuParam skuParam){
        GoodsSku goodsSku = GoodsSku.init(skuParam);

        // 无限库存
        if (goodsSku.isUnlimited()){
            goodsSku.setAvailable(999999999)
                    .setCapacity(999999999);
        }
        return skuManager.save(goodsSku).toDto();
    }


    /**
     * 根据 id 获取相应的商品SKU
     */
    public GoodsSkuDto getById(Long id) {
        GoodsSku goodsSku = skuManager.findById(id).orElseThrow(SkuNotFoundException::new);
        return goodsSku.toDto();
    }

    /**
     * 根据goodsId查询
     */
    public List<GoodsSkuDto> findByGoodsId(Long goodsId){
        return ResultConvertUtils.dtoListConvert(skuManager.findByGoodsId(goodsId));
    }

    /**
     * 批量查询sku
     */
    public List<GoodsSkuDto> findBySkuIds(List<Long> skuIds){
        return ResultConvertUtils.dtoListConvert(skuManager.findAllByIds(skuIds));
    }

}
