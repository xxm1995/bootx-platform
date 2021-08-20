package cn.bootx.goods.core.category.dao;

import cn.bootx.common.mybatisplus.impl.BaseManager;
import cn.bootx.goods.core.category.entity.Category;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;

/**
* 类目
* @author xxm  
* @date 2020/11/19 
*/
@Slf4j
@Repository
@RequiredArgsConstructor
public class CategoryManager extends BaseManager<CategoryMapper, Category> {

    public boolean existsName(String name) {
        return existedByField(Category::getName,name);
    }
}
