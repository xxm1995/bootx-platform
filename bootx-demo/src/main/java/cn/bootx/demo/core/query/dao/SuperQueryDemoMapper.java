package cn.bootx.demo.core.query.dao;

import cn.bootx.demo.core.query.entity.SuperQueryDemo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**   
* 超级查询
* @author xxm  
* @date 2022/2/21 
*/
@Mapper
public interface SuperQueryDemoMapper extends BaseMapper<SuperQueryDemo> {
}
