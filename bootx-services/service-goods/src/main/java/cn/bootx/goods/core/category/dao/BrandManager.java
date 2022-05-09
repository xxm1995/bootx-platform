package cn.bootx.goods.core.category.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.entity.Brand;
import cn.bootx.goods.param.category.BrandParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 品牌
 * @author xxm
 * @date 2022-05-09
 */
@Repository
@RequiredArgsConstructor
public class BrandManager extends BaseManager<BrandMapper, Brand> {
    private final BrandMapper mapper;

    /**
    * 分页
    */
    public Page<Brand> page(PageParam pageParam, BrandParam param) {
        Page<Brand> mpPage = MpUtil.getMpPage(pageParam, Brand.class);
        return lambdaQuery().orderByDesc(MpBaseEntity::getCreateTime).page(mpPage);
    }
}