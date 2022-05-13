package cn.bootx.goods.core.category.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.core.category.entity.CategoryBrand;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

import java.util.List;

/**   
*
* @author xxm  
* @date 2022/5/9 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class CategoryBrandManager extends BaseManager<CategoryBrandMapper, CategoryBrand> {

    public List<CategoryBrand> findAllByCategoryId(Long categoryId) {
        return findAllByField(CategoryBrand::getCategoryId,categoryId);
    }

    public void deleteByCategoryId(Long categoryId){
        deleteByField(CategoryBrand::getCategoryId,categoryId);
    }
}
