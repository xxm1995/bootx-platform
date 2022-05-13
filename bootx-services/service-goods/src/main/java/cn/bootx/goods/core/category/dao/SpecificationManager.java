package cn.bootx.goods.core.category.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.entity.Specification;
import cn.bootx.goods.param.category.SpecificationParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 规格
 * @author xxm
 * @date 2022-05-09
 */
@Repository
@RequiredArgsConstructor
public class SpecificationManager extends BaseManager<SpecificationMapper, Specification> {
    private final SpecificationMapper mapper;

    /**
    * 分页
    */
    public Page<Specification> page(PageParam pageParam, SpecificationParam param) {
        Page<Specification> mpPage = MpUtil.getMpPage(pageParam, Specification.class);
        return lambdaQuery().orderByDesc(MpBaseEntity::getId).page(mpPage);
    }
}