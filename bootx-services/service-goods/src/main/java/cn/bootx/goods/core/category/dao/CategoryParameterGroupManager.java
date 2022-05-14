package cn.bootx.goods.core.category.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpBaseEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.entity.CategoryParameterGroup;
import cn.bootx.goods.param.category.CategoryParameterGroupParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

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
        return lambdaQuery()
                .eq(CategoryParameterGroup::getCategoryId,param.getCategoryId())
                .orderByDesc(MpBaseEntity::getId)
                .page(mpPage);
    }

    /**
     * 名称是否存在
     */
    public boolean existedByName(String name,Long categoryId){
        return this.lambdaQuery()
                .eq(CategoryParameterGroup::getName,name)
                .eq(CategoryParameterGroup::getCategoryId,categoryId)
                .exists();
    }
    /**
     * 名称是否存在
     */
    public boolean existedByName(String name,Long categoryId,Long id){
        return this.lambdaQuery()
                .eq(CategoryParameterGroup::getName,name)
                .eq(CategoryParameterGroup::getCategoryId,categoryId)
                .ne(CategoryParameterGroup::getId,id)
                .exists();
    }
}