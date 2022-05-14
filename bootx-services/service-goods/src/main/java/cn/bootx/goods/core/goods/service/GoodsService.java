package cn.bootx.goods.core.goods.service;

import cn.bootx.common.core.exception.DataNotExistException;
import cn.bootx.common.core.rest.PageResult;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.core.util.ResultConvertUtil;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.goods.dao.GoodsManager;
import cn.bootx.goods.core.goods.entity.Goods;
import cn.bootx.goods.core.sku.dao.GoodsSkuManager;
import cn.bootx.goods.dto.goods.GoodsDto;
import cn.bootx.goods.dto.sku.GoodsSkuDto;
import cn.bootx.goods.param.goods.GoodsParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

/**
 *
 * @author xxm
 * @date 2020/11/20
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class GoodsService {
    private final GoodsManager goodsManager;
    private final GoodsSkuManager goodsSkuManager;

    /**
     * 新增商品
     */
    public GoodsDto add(GoodsParam goodsParam){
        Goods goods = Goods.init(goodsParam);
        return goodsManager.save(goods).toDto();
    }

    /**
     * 查询全部
     */
    public List<GoodsDto> findAll(){
        return ResultConvertUtil.dtoListConvert(goodsManager.findAll());
    }

    /**
     * 分页
     */
    public PageResult<GoodsDto> page(PageParam param,GoodsParam query){
        return MpUtil.convert2DtoPageResult(goodsManager.page(param,query));
    }

    /**
     * 查询商品详情
     */
    public GoodsDto getDetails(Long goodsId){
        GoodsDto goodsDto = goodsManager.findById(goodsId).map(Goods::toDto).orElseThrow(DataNotExistException::new);
        if (Objects.nonNull(goodsDto)){
            // 查询sku
            List<GoodsSkuDto> goodsSkus = ResultConvertUtil.dtoListConvert(goodsSkuManager.findByGoodsId(goodsId));
            goodsDto.setSkus(goodsSkus);
        }
        return goodsDto;
    }


    /**
     * 获取商品信息
     */
    public GoodsDto findById(Long goodsId){
        return goodsManager.findById(goodsId).map(Goods::toDto).orElseThrow(DataNotExistException::new);
    }

    /**
     * 按照类目查询商品
     */
    public List<GoodsDto> findByCategory(Long cid){
        return ResultConvertUtil.dtoListConvert(goodsManager.findByCid(cid));
    }
}
