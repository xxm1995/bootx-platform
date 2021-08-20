package cn.bootx.goods.core.category.dao;

import cn.bootx.goods.core.category.entity.Category;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 类目
* @author xxm  
* @date 2020/11/19 
*/
@Mapper
public interface CategoryMapper extends BaseMapper<Category> {
}
