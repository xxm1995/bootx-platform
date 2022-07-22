package cn.bootx.goods.core.category.dao;

import cn.bootx.common.core.rest.param.PageParam;
import cn.bootx.common.mybatisplus.base.MpIdEntity;
import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.common.mybatisplus.util.MpUtil;
import cn.bootx.goods.core.category.entity.CategoryParameter;
import cn.bootx.goods.param.category.CategoryParameterParam;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

/**
 * 类目参数
 * @author xxm
 * @date 2022-05-09
 */
@Repository
@RequiredArgsConstructor
public class CategoryParameterManager extends BaseManager<CategoryParameterMapper, CategoryParameter> {
    private final CategoryParameterMapper mapper;

    /**
    * 分页
    */
    public Page<CategoryParameter> page(PageParam pageParam, CategoryParameterParam param) {
        Page<CategoryParameter> mpPage = MpUtil.getMpPage(pageParam, CategoryParameter.class);
        return lambdaQuery()
                .eq(CategoryParameter::getCategoryId,param.getCategoryId())
                .eq(CategoryParameter::getGroupId,param.getGroupId())
                .orderByDesc(MpIdEntity::getId)
                .page(mpPage);
    }

    /**
     * 名称是否存在
     */
    public boolean existedByName(String name,Long groupId){
        return this.lambdaQuery()
                .eq(CategoryParameter::getName,name)
                .eq(CategoryParameter::getGroupId,groupId)
                .exists();
    }
    /**
     * 名称是否存在
     */
    public boolean existedByName(String name,Long groupId,Long id){
        return this.lambdaQuery()
                .eq(CategoryParameter::getName,name)
                .eq(CategoryParameter::getGroupId,groupId)
                .ne(CategoryParameter::getId,id)
                .exists();
    }
}