package cn.bootx.goods.core.category.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.core.category.entity.CategoryBrand;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**   
*
* @author xxm  
* @date 2022/5/9 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class CategoryBrandManager extends BaseManager<CategoryBrandMapper, CategoryBrand> {
}
