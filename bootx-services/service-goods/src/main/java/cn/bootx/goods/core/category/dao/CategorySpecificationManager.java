package cn.bootx.goods.core.category.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.core.category.entity.CategorySpecification;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
*
* @author xxm
* @date 2022/5/13
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class CategorySpecificationManager extends BaseManager<CategorySpecificationMapper, CategorySpecification> {

    public List<CategorySpecification> findAllByCategoryId(Long categoryId) {
        return findAllByField(CategorySpecification::getCategoryId,categoryId);
    }

    public void deleteByCategoryId(Long categoryId){
        deleteByField(CategorySpecification::getCategoryId,categoryId);
    }
}
