package cn.bootx.goods.core.category.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.param.category.CategoryParameterGroupParam;
import cn.bootx.goods.core.category.entity.CategoryParameterGroup;
import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
 * 类目参数组
 * @author xxm
 * @date 2022-05-09
 */
@Repository
@RequiredArgsConstructor
public class CategoryParameterGroupManager extends BaseManager<CategoryParameterGroupMapper, CategoryParameterGroup> {
    private final CategoryParameterGroupMapper mapper;

    /**
    * 分页
    */
    public Page<CategoryParameterGroup> page(PageParam pageParam, CategoryParameterGroupParam param) {
        Page<CategoryParameterGroup> mpPage = MpUtil.getMpPage(pageParam, CategoryParameterGroup.class);
        return lambdaQuery().orderByDesc(MpBaseEntity::getCreateTime).page(mpPage);
    }
}